package com.shopapp.presentation.navigation

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.shopapp.presentation.components.LoadingScreen
import com.shopapp.presentation.ui.admin.categories.AdminScaffold
import com.shopapp.presentation.ui.admin.categories.CategoriesAdminScreen
import com.shopapp.presentation.ui.admin.dashboard.DashboardScreen
import com.shopapp.presentation.ui.admin.notifications.NotificationScreen
import com.shopapp.presentation.ui.admin.orders.OrderAdminDetailScreen
import com.shopapp.presentation.ui.admin.orders.OrdersAdminScreen
import com.shopapp.presentation.ui.admin.products.ProductsAdminScreen
import com.shopapp.presentation.ui.admin.users.UsersAdminScreen
import com.shopapp.presentation.ui.auth.ForgotPasswordScreen
import com.shopapp.presentation.ui.auth.LoginScreen
import com.shopapp.presentation.ui.auth.RegisterScreen
import com.shopapp.presentation.ui.auth.ResetPasswordConfirmScreen
import com.shopapp.presentation.ui.client.orders.OrderDetailScreen
import com.shopapp.presentation.ui.client.orders.OrdersScreen
import com.shopapp.presentation.ui.client.profile.ProfileScreen
import com.shopapp.presentation.ui.uipublic.cart.CartBottomSheet
import com.shopapp.presentation.ui.uipublic.catalog.CatalogScreen
import com.shopapp.presentation.ui.uipublic.home.HomeScreen
import com.shopapp.presentation.ui.uipublic.product.ProductDetailScreen
import com.shopapp.presentation.viewmodel.AuthViewModel
import com.shopapp.presentation.viewmodel.CartViewModel
import com.shopapp.presentation.viewmodel.OrdersAdminViewModel
import com.shopapp.theme.Surface

@Composable
fun NavGraph(
    authViewModel: AuthViewModel,
    cartViewModel: CartViewModel = hiltViewModel(),
) {
    val navController     = rememberNavController()
    val isCheckingSession by authViewModel.isCheckingSession.collectAsState()
    val isAuthenticated   by authViewModel.isAuthenticated.collectAsState()
    val isStaff           by authViewModel.isStaff.collectAsState()
    val cartCount         by cartViewModel.totalItems.collectAsState()
    val currentUser       by authViewModel.currentUser.collectAsState()

    var showCart         by remember { mutableStateOf(false) }
    var confirmedOrderId by remember { mutableStateOf<Int?>(null) }

    if (isCheckingSession) {
        LoadingScreen("Iniciando ShopApp...")
        return
    }

    val startDestination = when {
        !isAuthenticated -> Screen.Login.route
        isStaff          -> Screen.AdminDashboard.route
        else             -> Screen.Home.route
    }

    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute      = navBackStackEntry?.destination?.route

    val showBottomBar = currentRoute in listOf(
        Screen.Home.route,
        Screen.Catalog.route,
        Screen.Orders.route,
        Screen.Profile.route,
    )

    Scaffold(
        containerColor = Surface,
        bottomBar = {
            if (showBottomBar) {
                BottomNavBar(
                    navController = navController,
                    cartCount     = cartCount,
                    onCartClick   = { showCart = true },
                )
            }
        },
    ) { innerPadding ->

        if (showCart) {
            CartBottomSheet(
                cartViewModel   = cartViewModel,
                isAuthenticated = isAuthenticated,
                onDismiss       = { showCart = false },
                onLoginRequired = {
                    showCart = false
                    navController.navigate(Screen.Login.route)
                },
                onOrderSuccess = { orderId ->
                    confirmedOrderId = orderId
                    showCart = false
                },
            )
        }

        NavHost(
            navController    = navController,
            startDestination = startDestination,
            modifier         = Modifier.padding(innerPadding),
        ) {
            // ── LOGIN y RECUPERACIÓN ───────────────
            composable(Screen.Login.route) {
                LoginScreen(
                    onLoginSuccess = { staff ->
                        val dest = if (staff) Screen.AdminDashboard.route else Screen.Home.route
                        navController.navigate(dest) { popUpTo(Screen.Login.route) { inclusive = true } }
                    },
                    onNavigateToRegister = { navController.navigate(Screen.Register.route) },
                    onForgotPassword     = { navController.navigate(Screen.ForgotPassword.route) },
                    viewModel            = authViewModel,
                )
            }
            composable(Screen.ForgotPassword.route) {
                ForgotPasswordScreen(onBack = { navController.popBackStack() }, onGoToConfirm = { navController.navigate(Screen.ResetPasswordConfirm.route) })
            }
            composable(Screen.ResetPasswordConfirm.route) {
                ResetPasswordConfirmScreen(onBack = { navController.popBackStack() }, onResetSuccess = { navController.navigate(Screen.Login.route) { popUpTo(Screen.Login.route) { inclusive = true } } })
            }
            composable(Screen.Register.route) {
                RegisterScreen(onRegisterSuccess = { staff -> navController.navigate(if (staff) Screen.AdminDashboard.route else Screen.Home.route) { popUpTo(Screen.Login.route) { inclusive = true } } }, onNavigateToLogin = { navController.popBackStack() }, viewModel = authViewModel)
            }

            // ── RUTAS CLIENTE ──────────────────────
            composable(Screen.Home.route) { HomeScreen(onProductClick = { id -> navController.navigate("product/$id") }, onCatalogClick = { navController.navigate(Screen.Catalog.route) }) }
            composable(Screen.Catalog.route) { CatalogScreen(onProductClick = { id -> navController.navigate("product/$id") }) }
            composable(route = "product/{id}", arguments = listOf(navArgument("id") { type = NavType.IntType })) { backStackEntry ->
                val id = backStackEntry.arguments?.getInt("id") ?: return@composable
                ProductDetailScreen(productId = id, onBack = { navController.popBackStack() }, cartViewModel = cartViewModel)
            }
            composable(Screen.Orders.route) { if (!isAuthenticated) LaunchedEffect(Unit) { navController.navigate(Screen.Login.route) } else OrdersScreen(onOrderClick = { id -> navController.navigate("orders/$id") }) }
            composable(route = "orders/{id}", arguments = listOf(navArgument("id") { type = NavType.IntType })) { backStackEntry ->
                val id = backStackEntry.arguments?.getInt("id") ?: return@composable
                OrderDetailScreen(orderId = id, onBack = { navController.popBackStack() })
            }
            composable(Screen.Profile.route) { if (!isAuthenticated) LaunchedEffect(Unit) { navController.navigate(Screen.Login.route) } else ProfileScreen(onLogout = { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) }

            // ── ADMIN ──────────────────────────────
            composable(Screen.AdminDashboard.route) { if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }; AdminScaffold(Screen.AdminDashboard.route, currentUser, "Dashboard", { route -> navController.navigate(route) }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { DashboardScreen { route -> navController.navigate(route) } } } }
            composable("admin/categories") { if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }; AdminScaffold("admin/categories", currentUser, "Categorías", { route -> navController.navigate(route) }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { CategoriesAdminScreen() } } }
            composable("admin/products") { if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }; AdminScaffold("admin/products", currentUser, "Productos", { route -> navController.navigate(route) }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { ProductsAdminScreen() } } }
            composable("admin/orders") { if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }; val vm: OrdersAdminViewModel = hiltViewModel(); AdminScaffold("admin/orders", currentUser, "Pedidos", { route -> navController.navigate(route) }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { OrdersAdminScreen({ id -> navController.navigate("admin/orders/$id") }, vm) } } }
            composable("admin/orders/{id}", arguments = listOf(navArgument("id") { type = NavType.IntType })) { backStackEntry ->
                val id = backStackEntry.arguments?.getInt("id") ?: return@composable
                if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }
                val parent = remember(backStackEntry) { navController.getBackStackEntry("admin/orders") }
                val vm: OrdersAdminViewModel = hiltViewModel(parent)
                AdminScaffold("admin/orders", currentUser, "Detalle #$id", { route -> navController.navigate(route) }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { OrderAdminDetailScreen(id, { navController.popBackStack() }, { ordId, status -> vm.changeStatus(ordId, status) }) } }
            }
            composable("admin/users") { if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }; AdminScaffold("admin/users", currentUser, "Usuarios", { route -> navController.navigate(route) }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { UsersAdminScreen() } } }

            // ── NUEVO: ADMIN NOTIFICATIONS ─────────
            composable("admin/notifications") {
                if (!isStaff) { LaunchedEffect(Unit) { navController.navigate(Screen.Home.route) { popUpTo(0) } }; return@composable }
                AdminScaffold("admin/notifications", currentUser, "Notificaciones", { route -> navController.navigate(route) { launchSingleTop = true } }, { navController.navigate(Screen.Home.route) }, { authViewModel.logout(); navController.navigate(Screen.Login.route) { popUpTo(0) { inclusive = true } } }) { padding -> Box(Modifier.padding(padding)) { NotificationScreen() } }
            }
        }
    }
}
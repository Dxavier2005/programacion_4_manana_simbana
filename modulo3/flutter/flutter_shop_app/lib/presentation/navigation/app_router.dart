import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app/presentation/screens/admin/categoriesadminscreen.dart';
import 'package:flutter_shop_app/presentation/screens/admin/dashboard_screen.dart';
import 'package:flutter_shop_app/presentation/screens/admin/orderadmindetail_screen.dart';
import 'package:flutter_shop_app/presentation/screens/admin/ordersadminscreen.dart';
import 'package:flutter_shop_app/presentation/screens/admin/productsadminscreen.dart';
import 'package:flutter_shop_app/presentation/screens/auth/profile_screen.dart';
import 'package:flutter_shop_app/presentation/screens/cart/cart_screen.dart';
@@ -137,20 +139,21 @@ final routerProvider = Provider<GoRouter>((ref) {
        ),
      ),
      GoRoute(
        path: '/admin/orders',
        path:    '/admin/orders',
        builder: (_, state) => AdminShell(
          title:        'Pedidos',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Pedidos admin — M10'),
          child:        const OrdersAdminScreen(),
        ),
      ),
      GoRoute(
        path: '/admin/orders/:id',
        path:    '/admin/orders/:id',
        builder: (_, state) => AdminShell(
          title:        'Detalle pedido',
          title:        'Detalle pedido #${state.pathParameters['id']}',
          currentRoute: '/admin/orders',
          child:        _AdminPlaceholder(
              'Pedido #${state.pathParameters['id']} — M10'),
          child:        OrderAdminDetailScreen(
            orderId: int.parse(state.pathParameters['id']!),
          ),
        ),
      ),
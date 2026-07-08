import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app/presentation/screens/admin/categoriesadminscreen.dart';
import 'package:flutter_shop_app/presentation/screens/admin/dashboard_screen.dart';
import 'package:flutter_shop_app/presentation/screens/admin/productsadminscreen.dart';
import 'package:flutter_shop_app/presentation/screens/auth/profile_screen.dart';
import 'package:flutter_shop_app/presentation/screens/cart/cart_screen.dart';
import 'package:flutter_shop_app/presentation/screens/catalog/product_detail_screen.dart';
@@ -128,11 +129,11 @@ final routerProvider = Provider<GoRouter>((ref) {
        ),
      ),
      GoRoute(
        path: '/admin/products',
        path:    '/admin/products',
        builder: (_, state) => AdminShell(
          title:        'Productos',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Productos — M9'),
          child:        const ProductsAdminScreen(),
        ),
      ),
      GoRoute(
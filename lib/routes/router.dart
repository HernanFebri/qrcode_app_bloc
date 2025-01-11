import 'package:go_router/go_router.dart';
import '../pages/detail_product.dart';
import '../pages/error.dart';
import '../pages/products.dart';
import '../pages/settings.dart';

import '../pages/home.dart';

export 'package:go_router/go_router.dart';

part 'route_name.dart';

final router = GoRouter(
  errorBuilder: (context, state) => ErrorPage(),
  routes: [
    // KALO 1 LEVEL --> PUSH REPLACEMENT
    // KALO SUB LEVEL --> PUSH BIASA (ADA TOMBOL BACK)
    // PRIORITAS DALAM PEMBUATAN GO ROUTER --> URUTAN DARI ATAS KE BAWAH
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
            path: 'products',
            name: Routes.products,
            builder: (context, state) => const ProductsPage(),
            routes: [
              GoRoute(
                path: ':productId',
                name: Routes.detailProduct,
                builder: (context, state) => DetailProductPage(
                  state.pathParameters['productId'].toString(),
                  state.uri.queryParameters,
                ),
              ),
            ]),
      ],
    ),
    GoRoute(
      path: '/settings',
      name: Routes.settings,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../pages/add_product.dart';
import '../pages/detail_product.dart';
import '../pages/error.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/products.dart';

part 'route_name.dart';

final router = GoRouter(
  redirect: (context, state) {
    FirebaseAuth auth = FirebaseAuth.instance;
    // cek kondisi saat ini -> sedang ada user login atau tidak
    if (auth.currentUser == null) {
      return '/login'; // Redirect ke login jika tidak ada user yang terautentikasi
    } else {
      return '/'; // Redirect ke home jika sudah terautentikasi
    }
  },
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
          ],
        ),
        GoRoute(
          path: 'add-product',
          name: Routes.addProduct,
          builder: (context, state) => const AddProductPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      name: Routes.login,
      builder: (context, state) => LoginPage(),
    ),
  ],
);

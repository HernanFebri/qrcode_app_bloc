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
    final bool isLoggedIn = auth.currentUser != null;
    final bool isGoingToLogin = state.uri.toString() == '/login';

    if (!isLoggedIn && !isGoingToLogin) {
      return '/login'; // Redirect ke login jika tidak ada user yang terautentikasi
    } else if (isLoggedIn && isGoingToLogin) {
      return '/'; // Redirect ke home jika sudah terautentikasi dan mencoba mengakses login
    }
    return null; // Tidak perlu redirect
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

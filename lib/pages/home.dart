import 'package:flutter/material.dart';
import '../routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).go('/settings');
                context.goNamed(Routes.settings);
              },
              child: const Text('Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).go('/products');
                context.goNamed(Routes.products);
              },
              child: const Text('Show All Products'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../routes/router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Settings Page'),
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).go('/');
                context.goNamed(Routes.home);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

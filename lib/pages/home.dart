import 'package:flutter/material.dart';
import 'package:qrcode_bloc_app/bloc/features/auth/presentation/bloc/auth_bloc.dart';
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateLogout) {
              context.goNamed(Routes.login);
            }
          },
          builder: (context, state) {
            if (state is AuthStateLoading) {
              return const CircularProgressIndicator();
            }
            if (state is AuthStateError) {
              return Text(state.message);
            }
            return Column(
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthEventLogout());
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/features/auth/presentation/bloc/auth_bloc.dart';
import '../routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLogout) {
          context.goNamed(Routes.login);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            late String title;
            late IconData icon;
            late VoidCallback ontap;

            switch (index) {
              case 0:
                title = 'Add Product';
                icon = Icons.post_add_rounded;
                ontap = () {
                  context.goNamed(Routes.addProduct);
                  print('Navigating to AddProductPage');
                };

                break;
              case 1:
                title = 'Products';
                icon = Icons.list_alt_outlined;
                ontap = () {
                  print('Navigating to ProductsPage');
                  context.goNamed(Routes.products);
                };
                break;
              case 2:
                title = 'QR Code';
                icon = Icons.qr_code;
                ontap = () {};

                break;
              case 3:
                title = 'Catalog';
                icon = Icons.document_scanner_outlined;
                ontap = () {};

                break;
            }

            return Material(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: ontap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        icon,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(title),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Trigger logout event
            context.read<AuthBloc>().add(AuthEventLogout());
          },
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}

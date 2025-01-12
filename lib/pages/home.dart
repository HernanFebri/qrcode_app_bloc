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
          context
              .goNamed(Routes.login); // Navigasi ke halaman login saat logout
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
            late VoidCallback onTap;

            switch (index) {
              case 0:
                title = 'Add Product';
                icon = Icons.post_add_rounded;
                onTap = () {
                  context.goNamed(Routes.addProduct);
                };
                break;
              case 1:
                title = 'Products';
                icon = Icons.list_alt_outlined;
                onTap = () {
                  context.goNamed(Routes.products);
                };
                break;
              case 2:
                title = 'QR Code';
                icon = Icons.qr_code;
                onTap = () {};
                break;
              case 3:
                title = 'Catalog';
                icon = Icons.document_scanner_outlined;
                onTap = () {};
                break;
            }

            return Material(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: onTap,
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
            // Tampilkan dialog konfirmasi logout
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Konfirmasi Logout'),
                  content: const Text('Apakah Anda yakin ingin logout?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Tutup dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Tidak'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Tutup dialog
                        Navigator.of(context).pop();
                        // Trigger logout event
                        context.read<AuthBloc>().add(AuthEventLogout());
                      },
                      child: const Text('Ya'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}

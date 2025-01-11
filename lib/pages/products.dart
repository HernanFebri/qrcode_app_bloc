import 'package:flutter/material.dart';

import '../routes/router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Page'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // penggunaan routing dynamic dengan parameter
              // tidak bisa melempar data dengan routing menggunakan path
              // context.go('/products/${index + 1}');
              // penggunaan routing dynamic dengan nama
              context.goNamed(
                Routes.detailProduct,
                pathParameters: {'productId': '${index + 1}'},
                queryParameters: {
                  'id': '${index + 1}',
                  'title': 'Product ${index + 1}',
                  'description': 'Description Product ${index + 1}'
                },
              );
            },
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Product ${index + 1}'),
            subtitle: Text('Description Product ${index + 1}'),
          );
        },
      ),
    );
  }
}

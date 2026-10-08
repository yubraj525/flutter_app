import 'package:flutter/material.dart';
import 'package:flutter_app/models/product_model.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecommerce')),
      body: ListView.builder(
        itemCount: Product.products.length,
        itemBuilder: (context, index) {
          Product product = Product.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(product: product),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(Product.products[index].imageUrl),
                          Text(Product.products[index].title),
                          Text('\$${Product.products[index].price}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

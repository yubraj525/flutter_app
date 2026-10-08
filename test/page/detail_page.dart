import 'package:flutter/material.dart';
import 'package:flutter_app/models/product_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),

          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),

                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image.asset(product.imageUrl),
                      Text(product.title),
                      Text(
                        '\NPR ${product.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(onPressed: () {}, child: Text("Buy Now")),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              // Text('hello'),
            ],
          ),
        ),
      ),
    );
  }
}

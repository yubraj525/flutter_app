import 'package:flutter/material.dart';
import 'page/home_page.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

void main() {
  runApp(const MyWidget());
}
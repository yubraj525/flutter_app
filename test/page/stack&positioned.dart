import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("to-do")),
      body: Stack(
       
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
            ),

          ]
        ),
      
    );
  }
}

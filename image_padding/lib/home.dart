import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Image Padding'),
        centerTitle: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/pikachu-1.jpg', width: 100,),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Image.asset('images/pikachu-2.jpg', width: 100,),
            ),
            Image.asset('images/pikachu-3.jpg', width: 100,)
          ],
        ),
      ),
      
    );
  }
}
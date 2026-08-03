import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Image01'),
        centerTitle: false,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(   // 원에 이미지를 넣을때 사용
              backgroundImage: AssetImage(
                'images/pikachu-1.jpg'
              ),
              radius: 70,     // 원이니까 반지름 크기를 조절
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/pikachu-2.jpg'
                ),
                radius: 70,     
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage(
                'images/pikachu-3.jpg'
              ),
              radius: 70,     
            )
          ],
        ),
      ),
    );
  }
}
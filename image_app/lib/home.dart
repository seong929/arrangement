import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,  // body의 background color
      appBar: AppBar(
        title: Text('Image Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(    // 스크롤 기능을 추가해줌
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/smile.png',
                width: 100,
              ),
              Image.asset(
                'images/smile.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,  // default fitting(원본 크기에 맞춰줌)
              ),
              Row(
                children: [
                  Image.asset(
                    'images/smile.png',
                    width: 50,
                    height: 100,
                    fit: BoxFit.fill,  // 내가 만든 크기에 꽉채워줌
                  ),
                ],
              ),
              Image.asset(
                'images/smile.png',
                width: 50,
                height: 100,
                fit: BoxFit.fitWidth,  // 전체 크기를 50으로 맞춰줌
              ),
              Image.asset(
                'images/smile.png',
                width: 50,
                height: 100,
                fit: BoxFit.fitWidth,  // 전체 크기를 50으로 맞춰줌
              ),
              Image.asset(
                'images/smile.png',
                height: 100,
              ),
              Image.asset(
                'images/smile.png',
                height: 100,
              ),
              Image.asset(
                'images/smile.png',
                height: 100,
              ),
              Image.asset(
                'images/smile.png',
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
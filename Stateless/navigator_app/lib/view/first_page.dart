import 'package:flutter/material.dart';
import 'package:navigator_app/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {    // 첫번째 페이지 위치를 알려주고, 세컨 페이지 위치를 설정
              return SecondPage();
            },));
          }, 
          child: Text('Go to the second page'),
        ),
      ),
    );
  }
}
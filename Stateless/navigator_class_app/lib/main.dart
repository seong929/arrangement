import 'package:flutter/material.dart';
import 'package:navigator_class_app/view/first_page.dart';
import 'package:navigator_class_app/view/home.dart';
import 'package:navigator_class_app/view/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {           // 앞의 예시들과는 다른점
        '/' :(context) => Home(),
        '/1st' :(context) {
          return FirstPage();
        },
        '/2nd' :(context) => SecondPage()
      },
    );
  }
}


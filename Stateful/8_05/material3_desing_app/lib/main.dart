import 'package:flutter/material.dart';
import 'package:material3_desing_app/home.dart';

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
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 128, 39, 57)), // 이 색깔과 어울리는 색으로 home에서 변경해주는거임
      ),
      home: const Home(),
    );
  }
}

import 'package:drawer_ex_app/view/home.dart';
import 'package:drawer_ex_app/view/receive.dart';
import 'package:drawer_ex_app/view/send.dart';
import 'package:flutter/material.dart';

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
      routes: {
        '/' : (context) => Home(),
        '/send' : (context) => Sendemail(),
        '/receive' : (context) => Receiveemail()
      },
    );
  }
}


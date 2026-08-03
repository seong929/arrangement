import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app2/view/mail.dart';
import 'package:navigator_appbar_ex_app2/view/receivedmail.dart';
import 'package:navigator_appbar_ex_app2/view/sendmail.dart';

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
        '/' :(context) => Mail(),
        '/send' :(context) => Sendmail(),
        '/receive' : (context) => Receivedmail(),
      },
      initialRoute: '/',
    );
  }
}


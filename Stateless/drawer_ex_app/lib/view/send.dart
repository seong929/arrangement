import 'package:flutter/material.dart';

class Sendemail extends StatelessWidget {
  const Sendemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text('Send Mail'),
        centerTitle: true,
      ),
    );
  }
}
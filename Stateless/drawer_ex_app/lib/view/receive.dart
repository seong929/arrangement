import 'package:flutter/material.dart';

class Receiveemail extends StatelessWidget {
  const Receiveemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text('Received Mail'),
        centerTitle: true,
      ),
    );
  }
}
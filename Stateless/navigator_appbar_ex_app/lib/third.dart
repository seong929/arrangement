import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Received Mail'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('유비에게 온 메일'),
          Text('관우에게 온 메일'),
          Text('장비에게 온 메일'),
        ],
      ),
    );
  }
}
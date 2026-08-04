import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final String id;
  const Second({super.key, required this.id});    // required this.id 추가

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.id}님 환영합니다.'),  // widget.id를 사용해 앞에서 만든걸 가져옴
      ),
    );
  }
}
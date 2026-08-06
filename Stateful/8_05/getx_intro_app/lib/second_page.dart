import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  
  // Property
  var value = Get.arguments ?? '__';   // var은 처음 들어온 데이터의 타입으로 정해짐 // 데이터값이 널이면 __ 다.
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.back(),  // 이전 페이지로 돌아감 2번 쓰면 2번 돌아감 
              child: Text('Exit'),
            ),
            Text(
              'Single Argument : $value'
            ),
            Text(
              'Multiple Argument #1 : ${value[0]}'
            ),
            Text(
              'Multiple Argument #2 : ${value[1]}'
            ),
            ElevatedButton(
              onPressed: () => Get.back(result: 'Good'), 
              child: Text('Reply'),
            ),
          ],
        ),
      ),
    );
  }
}
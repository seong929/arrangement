import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar( // line 17~23
              SnackBar(
                content: Text('Elevated Button is clicked'),
                backgroundColor: Colors.pinkAccent,
                duration: Duration(seconds: 2), // 화면에 얼마나 띄울지 설정
              ),
            );
          }, 
          child: Text('Snackbar Button'),
        ),
      );
    }
}
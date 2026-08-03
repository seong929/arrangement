import 'package:flutter/material.dart';

class Homefunction extends StatelessWidget {
  const Homefunction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => snackBarFunction(context), 
          child: Text('Snackbar Button'),
        ),
      ),
    );
  } // build

  // --- Functions ---
  void snackBarFunction(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar( // line 17~23
      SnackBar(
        content: Text('Elevated Button is clicked'),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 2), // 화면에 얼마나 띄울지 설정
      ),
    );    
  }

} // class

/*
    ScaffoldMessenger.of(context).showSnackBar( // line 17~23
    SnackBar(
      content: Text('Elevated Button is clicked'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2), // 화면에 얼마나 띄울지 설정
    ),
  );
*/
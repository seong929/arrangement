import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> str;
  late int currentCharacter;
  late String character;

  @override
  void initState() {
    super.initState();
    String data = '대한민국';
    str = data.split(''); // ['대', '한', '민', '국']

    currentCharacter = 0;
    character = str[currentCharacter];  // '대'가 생성됨

    Timer.periodic(Duration(seconds: 2), (timer) => changeCharacter(),);
  }

  void changeCharacter(){
    currentCharacter++;
    if(currentCharacter >= str.length){
      currentCharacter = 0;
      character = str[currentCharacter];
    }else{
      character += str[currentCharacter];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          character,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
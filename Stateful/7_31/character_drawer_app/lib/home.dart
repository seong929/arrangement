
import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late TextEditingController wordcontroller;
  late List<String> wordList;
  late int currentWord;
  late String character;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    wordcontroller = TextEditingController();
    wordList = ''.split('');
    currentWord = 0;
    character = '';

    _timer = Timer.periodic(Duration(seconds: 1), (timer) => _changeText(),);
  }

  void _changeText(){
    if(currentWord >= wordList.length){
      currentWord = 0;
      character = '';
    }else{
      character += wordList[currentWord];
      currentWord++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  '광고 문구를 입력하세요,',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: TextField(
                controller: wordcontroller,
                decoration: InputDecoration(
                  labelText: '글자를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  pushName();
                }, 
                child: Text(
                  '광고문구 생성',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          character,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  void pushName(){
    if(wordcontroller.text.trim().isNotEmpty){
      wordList = wordcontroller.text.trim().split('');
      currentWord = 0;
      character = '';
      wordcontroller.clear();
    }
    Navigator.pop(context);

    setState(() {});
  }

}
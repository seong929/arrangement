import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;  // Switch의 상태
  late String switchText; // Switch의 상태 글씨
  late String switchImage;

  @override
  void initState() {
    super.initState();
    switchValue = true;   // 처음엔 켜져있는 상태로 보겠다. line 26에서 사용
    switchText = 'smile';
    switchImage = 'smile.png';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(switchText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/$switchImage',
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchText),
                Switch(
                value: switchValue,       // 스위치를 true fales에 따라 다르게 설정 가능
                onChanged: (value) {      // 옮길때의 이벤트 발생(사용자가 옮긴값)
                switchValue = value;
                _switchAction(value);
                },   
              ),
              ],
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Function ---
  // Switch의 변경에 따른 화면 구성 변경
  void _switchAction(bool value){     // 타입을 모르기 때문에 따로 정의해줌
    if(value == true){
      switchText = 'smile';
      switchImage = 'smile.png';
    }else{
      switchText = 'pikachu';
      switchImage = 'pikachu-1.jpg';
    }
    setState(() {});        // 해줘야 옮기는걸 가능하게함
  }

} // class
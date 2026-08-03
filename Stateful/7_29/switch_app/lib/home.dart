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

  @override
  void initState() {
    super.initState();
    switchValue = true;   // 처음엔 켜져있는 상태로 보겠다. line 26에서 사용
    switchText = 'ON';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Switch'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(switchText),
            Switch(                     // wrap with row로 앞에 글씨를 추가
              value: switchValue,       // 스위치를 true fales에 따라 다르게 설정 가능
              onChanged: (value) {      // 옮길때의 이벤트 발생(사용자가 옮긴값)
                switchValue = value;
                _switchAction(value);
              },   
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
      switchText = 'ON';
    }else{
      switchText = 'OFF';
    }
    setState(() {});        // 해줘야 옮기는걸 가능하게함
  }

} // class
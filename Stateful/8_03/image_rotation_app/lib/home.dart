import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchColor;  // Switch 상태
  late String imageName;  // image file name
  late double angle;      // 회전 각도
  late String switchName; // Switch label
  late Timer _timer;      // Timer
  late double scale;

  @override
  void initState() {
    super.initState();
    switchColor = false;
    imageName = 'images/lamp_on.png';
    angle = 0;
    switchName = 'Yellow';
    scale = 1.0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {},);
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    angle = angle > 360 ? 0 : angle;    // angle이 360도 이상으로 가면 0으로 바꾸는 기능
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(angle/360), // 진행하다가 언제 세울지 설정하는 기능
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(   // image에 widght을 추가해 rotationtransition 추가
                    imageName,
                    height: 300 * scale,    //boxfit.contain이 기본 설정이라 height, width 중 하나만 사용해도 됨
                  ),
                  Text('apple')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      angle -= 10;
                      setState(() {});
                    }, 
                    child: Text('-10'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      angle += 10;
                      setState(() {});
                    }, 
                    child: Text('+10'),
                  ),
                  ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Reset'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  switchName
                ),
                Switch(
                  value: switchColor, 
                  onChanged: (value){
                    switchColor = value;
                    checkLampColor(value);
                  } 
                ),
              ],
            ),
            SizedBox(
              width: 300,
              child: Slider(
                value: angle,
                min: 0,
                max: 360, 
                onChanged: (value) {
                  angle = value;
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer, 
                  child: Text('Start Timer'),
                ),
                ElevatedButton(
                  onPressed: stopTimer, 
                  child: Text('Stop Timer'),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              child: Slider(
                value: scale,
                min: 0.5,
                max: 1.5, 
                onChanged: (value) {
                  scale = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  void reset(){
    angle = 0;
    scale = 1.0;
    imageName = 'images/lamp_on.png';
    switchName = 'Yellow';
    switchColor = false;
    setState(() {});
  }

  void checkLampColor(bool value){
    imageName = switchColor ? 'images/lamp_red.png' : 'images/lamp_on.png';
    switchName = switchColor ? 'Red' : 'Yellow';
    setState(() {});
  }

  void startTimer(){  // 죽인 다음에 안만들면 메모리에 계속 쌓이게됨
    _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      angle++;
      setState(() {});
    },);
  }

  void stopTimer(){
    _timer.cancel();
    reset();
  }
} // class
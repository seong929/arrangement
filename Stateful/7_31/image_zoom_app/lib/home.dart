//property 텍스트 버튼, 크기, 높이, 스위치, 이미지가 큰지 작은지
//스위치랑 버튼 차이점 , 스위치는 true, 버튼은 계속 누름

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late double _lampWidth;   // Image width
  late double _lampHeight;  // Image height
  late String _lampImage;   // image file name
  late String _buttonTitle; // Button Title
  late bool _switch;        // Switch켜짐 상태
  late bool _lamppSize;     // 화면의 램프 크기 상태 / false : 작은 이미지, true : 큰 이미지

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonTitle = 'Image 확대';
    _switch = true;
    _lamppSize = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              child: SizedBox(//안 움직이게 하려고 이미지를
                width: 330,
                height: 630,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: decisionLampSize,
                  child: Text(_buttonTitle),
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Switch(
                      value: _switch, 
                      onChanged: (value) {
                        _switch = value;
                        decisionOnOff();
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }//build
  void decisionOnOff(){
    _lampImage = _switch ? 'images/lamp_on.png' : 'images/lamp_off.png';

    //if(_switch){
    //  _lampImage = 'images/lamp_on.png';
    //}else{
    //  _lampImage = 'images/lamp_off.png';
    //}

    setState(() {});
  }

  void decisionLampSize(){
    if(_lamppSize){ // 현재 이미지가 큰 이미지일 경우
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonTitle = '이미지 확대';
      _lamppSize = false;
    }else{ // 현재 이미지가 작은 이미지일 경우
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonTitle = '이미지 축소';
      _lamppSize = true;
    }
    setState(() {});
  }
}//class
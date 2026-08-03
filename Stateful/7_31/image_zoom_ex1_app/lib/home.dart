import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late String _lampImage;     // image file name
  late double _lampWidth;     // image Width
  late double _lampHeight;    // image Height
  late bool _switch;          // Switch 켜짐 상태
  late bool _lampSize;        // 화면의 램프 크기 상태 (false: 축소, true: 확대)

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switch = true;
    _lampSize = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image 확대 및 축소'),
        backgroundColor: Colors.blue, // 예제 이미지에 맞춘 파란색 AppBar
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 💡 이미지 프레임 영역 (확대/축소 시 레이아웃 유지)
            Container(
              width: 330,
              height: 500,
              alignment: Alignment.center,
              child: Image.asset(
                _lampImage,
                width: _lampWidth,
                height: _lampHeight,
              ),
            ),
            
            // 💡 하단 2개의 스위치 영역
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. 전구 확대 스위치
                Column(
                  children: [
                    const Text(
                      '전구 확대',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Switch(
                      value: _lampSize,
                      onChanged: (value) {
                        _lampSize = value;
                        decisionLampSize();
                      },
                    ),
                  ],
                ),

                const SizedBox(width: 30), // 스위치 간 간격

                // 2. 전구 스위치 (ON/OFF)
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        _switch = value;
                        decisionOnOff();
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  
  // 💡 전구 ON/OFF 제어
  void decisionOnOff() {
    _lampImage = _switch ? 'images/lamp_on.png' : 'images/lamp_off.png';
    setState(() {});
  }

  // 💡 전구 확대/축소 제어
  void decisionLampSize() {
    if (_lampSize) {
      // 스위치가 ON(true)이 되었을 때 -> 확대
      _lampWidth = 250;
      _lampHeight = 500;
    } else {
      // 스위치가 OFF(false)가 되었을 때 -> 축소
      _lampWidth = 150;
      _lampHeight = 300;
    }
    setState(() {});
  }

} // class
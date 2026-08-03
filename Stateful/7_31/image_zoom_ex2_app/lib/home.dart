import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late String _lampImage;     
  late double _lampWidth;     
  late double _lampHeight;    
  late bool _switch;          
  late bool _lampSize;      
  late bool _lampColor;  

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switch = true;
    _lampSize = false;
    _lampColor = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image 확대 및 축소'),
        backgroundColor: Colors.blue, 
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '전구 색깔',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Switch(
                      value: _lampColor, 
                      onChanged: (value){
                        _lampColor = value;
                        decisionColor();
                      },
                    ),
                  ],
                ),
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
  
  void decisionColor(){
    _lampImage = _lampColor ? 'images/lamp_red.png' : 'images/lamp_on.png';
    setState(() {});
  }

  void decisionOnOff() {
    _lampImage = _switch ? 'images/lamp_on.png' : 'images/lamp_off.png';
    setState(() {});
  }

  void decisionLampSize() {
    if (_lampSize) {
      _lampWidth = 250;
      _lampHeight = 500;
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
    }
    setState(() {});
  }

} // class
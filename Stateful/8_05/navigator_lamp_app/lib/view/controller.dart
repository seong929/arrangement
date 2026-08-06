// 두번째 화면
import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/util/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {

  // Property
  late TextEditingController textEditingController; // 다른 클래스라 홈이랑 같아도 지장 X
  late String switchLabel;
  late bool switchValue;
  
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = Message.contents; // 앞 화면에서 온 데이터를 받을 수 있음

    if(Message.lampStatus){ // message의 lampstatus로 확인할 수 있음
      switchLabel = 'ON';
      switchValue = true;
    }else{
      switchLabel = 'OFF';
      switchValue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabel),
                Switch(
                  value: switchValue, 
                  onChanged: (value) {
                    switchValue = value;  // 스위치의 모습을 보여주기 위해 value 사용
                    switchLabel = switchValue ? 'ON' : 'OFF';
                    setState(() {});
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Message.contents = textEditingController.text;  // 메시지 들어가게 해줌
                  Message.lampStatus = switchValue;
                  Navigator.pop(context);
                }, 
                child: Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
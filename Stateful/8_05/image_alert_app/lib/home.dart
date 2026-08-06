import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool lampSwitch;

  @override
  void initState() {
    super.initState();
    lampSwitch = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              lampSwitch ? 'images/lamp_on.png' : 'images/lamp_off.png',
              width: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      lampOn();
                    }, 
                    child: Text('켜기'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      lampOff();
                    }, 
                    child: Text('끄기'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  } // build

  void lampOn(){
    if(lampSwitch == true){
      Get.defaultDialog(
        title: '경고',
        middleText: '현재 램프가 켜진 상태 입니다.',
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text('네, 알겠습니다.'),
          ),
        ]
      );
    }else{
      lampSwitch = true;
      setState(() {});
    }
  }

  void lampOff(){
    if(lampSwitch == false){
      Get.defaultDialog(
        title: '경고',
        middleText: '현재 램프가 꺼진 상태 입니다,',
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () => Get.back(), 
            child: Text('네, 알겠습니다.'),
          ),
        ]
      );
    }else{
      _actionSheet();
    }
  }
  
  void _actionSheet(){
    showCupertinoModalPopup(
      context: context, 
      barrierDismissible: false,
      builder: (context) => CupertinoActionSheet(
        title: Text('램프 끄기'),
        message: Text('램프를 끄시겠습니까?'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
              lampSwitch = false;
              setState(() {});
            }, 
            child: Text('예'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            }, 
            child: Text('아니요'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(), 
          child: Text('Cancel'),
        ),
      ),
    );
  }

} // class
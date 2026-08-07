import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  String currentDateTime = '';
  DateTime? chosenDateTime;
  final bool _isRunning = true;
  
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(!_isRunning){    // 시스템이 실행중이 아니면 멈춤
        timer.cancel();
      }
      _addItem();
    },);
  }

  void _addItem(){
    final DateTime now = DateTime.now();  // Date.Time은 cpu가 알고있음
    currentDateTime = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
                      '${_weekDayToString(now.weekday)} ' '${now.hour.toString().padLeft(2, '0')}:' 
                      '${now.minute.toString().padLeft(2, '0')}:''${now.second.toString().padLeft(2, '0')}';
    setState(() {});
  }
  
  String _weekDayToString(int weekday){
    String dateName = '';
    
    switch(weekday){
      case 1:
        dateName = '월';
      case 2:
        dateName = '화';
      case 3:
        dateName = '수';
      case 4:
        dateName = '목';
      case 5:
        dateName = '금';
      case 6:
        dateName = '토';
      default:
        dateName = '일';
    }
    
    return dateName;  // 이 함수를 String으로 선언했기 때문에 return도 String으로 해야함
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재시간 : $currentDateTime',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),  // 현재 일자가 찍히는 기능
                use24hFormat: true,
                onDateTimeChanged: (value) {
                  chosenDateTime = value;
                  setState(() {});
                },
              ),
            ),
            Text(
              '선택시간 : ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : '시간을 선택 하세요'}'
            )
          ],
        ),
      ),
    );
  } // build

  // --- Functions --- 
  String _chosenItem(DateTime now1){
    String chosendDateTime1 =  '${now1.year}-${now1.month.toString().padLeft(2, '0')}-${now1.day.toString().padLeft(2, '0')} '
                                '${_weekDayToString(now1.weekday)} ' '${now1.hour.toString().padLeft(2, '0')}:' 
                                '${now1.minute.toString().padLeft(2, '0')}:';
    return chosendDateTime1;
  }



} // class
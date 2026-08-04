import 'package:flutter/material.dart';
import 'package:listview_todo_app/util/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // Property
  late TextEditingController textEditingController;
  late bool switchPurchase;   // 구매 스위치
  late bool switchPromise;    // 약속 스위치
  late bool switchStudy;      // 스터디 스위치

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchPurchase = true;
    switchPromise = false;
    switchStudy = false;
    Message.imagePath = 'images/cart.png';  // 초기값
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('구매'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('약속'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('스터디'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Switch(
                      value: switchPurchase, 
                      onChanged: (value) {
                        switchPurchase = value;
                        switchPromise = false;
                        switchStudy = false;
                        Message.imagePath = 'images/cart.png';
                        switchNoneCheck();  // 3개의 스위치 모두 false면 구매를 true로 바꿔줌
                      },
                    ),
                    Switch(
                      value: switchPromise, 
                      onChanged: (value) {
                        switchPurchase = false;
                        switchPromise = value;
                        switchStudy = false;
                        Message.imagePath = 'images/clock.png';
                        switchNoneCheck();
                      },
                    ),
                    Switch(
                      value: switchStudy, 
                      onChanged: (value) {
                        switchPurchase = false;
                        switchPromise = false;
                        switchStudy = value;
                        Message.imagePath = 'images/pencil.png';
                        switchNoneCheck();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/cart.png',
                      width: 50,
                    ),
                    Image.asset(
                      'images/clock.png',
                      width: 50,
                    ),
                    Image.asset(
                      'images/pencil.png',
                      width: 50,
                    ),
                  ],
                )
              ],
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: '목록을 입력 하세요'
              ),
            ),
            ElevatedButton(   
              onPressed: () {
                if(textEditingController.text.trim().isNotEmpty){
                  addList();
                }
                Navigator.pop(context);
              }, 
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---  
  void addList(){
    // Message.imagePath = 'images/pencil.png';
    Message.workList = textEditingController.text.trim();
    Message.action = true;
  }

  void switchNoneCheck(){
    if(switchPromise == false && switchPurchase == false && switchStudy == false){
      switchPurchase = true;
      Message.imagePath = 'images/cart.png';
    }
    setState(() {});
  }

} // class
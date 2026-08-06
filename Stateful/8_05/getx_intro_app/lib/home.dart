import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ //
            Text('Navigation'),
            ElevatedButton(     
              onPressed: () => Get.to(SecondPage()),  //  2번째 화면으로 이동
              child: Text('Get.to() : 화면이동'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third'), // main에 이름을 정해뒀으니 Get.toNamed를 사용 
              child: Text('Get.toNamed() : 화면이동'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,  // 여기 윗부분이 Navigator
            ),
            Text('Snack Bar'),
            ElevatedButton(
              onPressed: buttonSnack, 
              child: Text('SnackBar'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,  // SnackBar 부분
            ),
            Text('Dialog'),
            ElevatedButton(
              onPressed: () => buttonDialog(), 
              child: Text('Dialog'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,  // Dialog 부분
            ),
            Text('Bottom Sheet'),
            ElevatedButton(
              onPressed: () => buttonBottomSheet(), 
              child: Text('Bottom sheet'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Screen Transition'),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  SecondPage(),
                  transition: Transition.circularReveal, // 페이지 이동할때 효과 부여
                  duration: Duration(seconds: 2)        // home에서 만드는 거라 여기서 바로 효과를 줘도 상관없음
                );
              }, 
              child: Text('Screen Transition : Get.to()'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('third2'), 
              child: Text('Screen Transition : Get.toNamed()'), // main에 생성해놨기 때문에 효과도 main에서 줘야함
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Navigation & Arguments'),
            ElevatedButton( // =>는 fatarrow라 불림 {}는 스코프
              onPressed: () => Get.to(
                                  SecondPage(),
                                  arguments: 'First'    // argument를 안쓰면 final 생성자를 사용해야함
              ), 
              child: Text('Get.to() : Single Data'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                                  SecondPage(),
                                  arguments: ['First', 'Second']
              ), 
              child: Text('Get.to() : Multiple Data'),
            ),
            ElevatedButton(
              onPressed: () async{  // async는 다른 cpu를 사용
                var returnValue = await Get.to(SecondPage()); // get.to가 죽을때까지 기다리게 하는 기능
                Get.snackbar('Return Value', returnValue);
              }, 
              child: Text('Get.to() : Return Argument'),  // 버튼 누르고 나서 second로 가고 second의 데이터를 가지고 돌아옴
            ),
          ],
        ),
      ),
    );
  } // build

  // ---Functions ---
  void buttonSnack(){
    Get.snackbar(
      'SnackBar', // Title
      'Message',  // Message
      snackPosition: SnackPosition.TOP, // 스낵바를 어디다 띄울지 설정(Top 또는 Bottom)
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white,  // 글자 색깔
    );
  }

  void buttonDialog(){
    Get.defaultDialog(
      title: 'Dialog',  // 제목
      middleText: 'Message',  // 내용
      backgroundColor: Colors.amberAccent,
      barrierDismissible: false,  // Dialog 이외의 부분을 눌러도 창에서 안나가짐
      actions: [
        TextButton(
          onPressed: () => Get.back(), 
          child: Text('Exit'),
        ),
      ]
    );
  }

  void buttonBottomSheet(){   // 아래에서 위로 올라오는 기능
    Get.bottomSheet(
      Container(
        width: 500,
        height: 300,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text Line1'),
            Text('Text Line2'),
            ElevatedButton(
              onPressed: () => Get.back(), 
              child: Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }

} // class
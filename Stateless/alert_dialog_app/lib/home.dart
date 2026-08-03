import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text(    // text를 위젯으로 감싸줌
            'Hello world'
          ),
        ),
      ),
    );
  } // build

  void _showDialog(BuildContext context){     // 함수로 정의했고 line 14에서 사용
    showDialog(
      context: context,
      barrierDismissible: false,          // 죵료 이외의 것을 클릭했을때 없어지는것을 방지해줌
      // barrierColor: Colors.amber[100],  // 눌렀을때의 색깔 변화
      builder: (context){
        return AlertDialog(
          title: Text('Alert Title'),
          content: Text('Helo World를\nTouch 했습니다.'),    // \n을 사용해서 줄바꿈 가능
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();    // 한페이지 이므로 of를 써줌
                }, 
                child: Text('종료'),
              ),
            )
          ],
        );
      },
    );
  }
} // class
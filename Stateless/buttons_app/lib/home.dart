import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});    // super.key는 생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Buttons"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => print('text button'),  // 한 번 눌렀을 때
              onLongPress: () => addFunction(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red
              ), // fat arrow는 한줄 쓸 때 많이 사용
              child: Text(          // 버튼에 보이는 글씨 child는 맨 밑에 있어야함
                'Text Button',
                style: TextStyle(
                  fontSize: 20      // 글씨 크기
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(  // 버튼의 형태를 결정
                  borderRadius: BorderRadius.circular(10) // 숫자를 키울수록 테두리가 둥그러짐
                )                
              ),
              child: Text(
                'Elevated Button'
              ),
            ),
            OutlinedButton(
              onPressed: () {
                
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(
                  color: Colors.black,
                  width: 2.0
                )
              ), 
              child: Text(
                'Outline Button'
              ),
            ),
            TextButton.icon(
              onPressed: () {
                
              },
              icon: Icon(
                Icons.home,
                size: 30,   // 아이콘 크기조절
                color: Colors.red,
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black
              ),
              label: Text('Go to home'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                
              }, 
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(150, 40)    // 버튼의 사이즈를 고정 시켜줌
              ),
              label: Text('Go to Home'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
                ), 
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              label: Text('Go to Home'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      
                    }, 
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue
                    ),
                    child: Text('TextButton'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    child: Text('ElevatedButton'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ----- Function -----
  // 숫자 10과 20을 받아 덧셈하는 Function
  void addFunction(){
    int intNum1 = 10;
    int intNum2 = 20;

    print("$intNum1 + $intNum2 = ${intNum1 + intNum2}");
  }



} // class
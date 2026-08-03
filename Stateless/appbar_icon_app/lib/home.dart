import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.home),
            GestureDetector(
              onDoubleTap: () {
                print('Title double tap.');
              },
              child: Text(' App Bar Icon'),
            ),
            IconButton(
              onPressed: () {
                
              }, 
              icon: Icon(Icons.access_alarm),
            ),   // text를 2줄 쓸려면 text를 colunm으로
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100,   // appbar 높이 조절
        // toolbarOpacity: 0.5,  // appbar 투명도
        leading: IconButton(  // leading은 appbar에서 한개만 존재
          onPressed: () {
            
          }, 
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.add_outlined),
          ),
          GestureDetector(
            onTap: () {
              print('---------- Smile image is tapped');
            },
            child: Image.asset(   // image에 전구표시를 누른후 widget을 활용해서 누르는 기능 추가
              'images/smile.png',
              width: 30,  // 이미지 크기를 높이 너비 둘 다 조정
            ),
          ),
          SizedBox(   // 투명 박스를 넣어서 위치 조정 가능
            width: 10,
          )
        ],
      ),
    );
  }
}
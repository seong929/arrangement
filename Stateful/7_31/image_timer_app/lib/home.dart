import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late List<String> imagesFile; // 이미지 파일 이름
  late int currentPage; // 리스트 순서
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;

    // Timer 설치
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      changeImage();  // 3초마다 한 번씩 changeImage() 함수를 호출
    },);  // 타이머의 범위를 정해줌
  }

  @override
  void dispose(){ // App을 종료할 때 사용
    _timer.cancel();  // Timer의 메모리 정리(super.dispose() 앞에 써줘야함)
    super.dispose();  // build의 메모리 정리
  }

  void changeImage(){
    currentPage += 1;
    if(currentPage >= imagesFile.length){
      currentPage = 0;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('3초마다 이미지 무한 반복'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(   // 사진 위 글씨가 나오게 하는 기능
              imagesFile[currentPage],
              style: const TextStyle(   // TextStyle은 안바뀔거니까 const(위젯에 사용) 선언
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(   // 사진의 모서리 부분을 깎는 역할
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'images/${imagesFile[currentPage]}',   // currentPage 부분을 먼저 실행하고 imagesFile 수행
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
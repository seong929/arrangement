import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg',
    ];
    selectedItem = 0; // 첫화면에도 이미지가 보여야 하기 때문에 초기값을 0으로 설정
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Picker View로 이미지 선택',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 300,
              height: 250,
              child: CupertinoPicker(
                itemExtent: 50,                   // 이미지의 크기를 조정 
                onSelectedItemChanged: (value) {  // 선택했을때 어떻게 할지
                  selectedItem = value;           // 사용자가 몇번째 그림에서 멈췄는지 알 수 있음
                  setState(() {});
                },   
                children: List.generate(          // List.generate를 사용해 이미지 추가하는 방법
                  imageName.length,               // 개수
                  (index) => Center(
                    child: Image.asset(
                      'images/${imageName[index]}',
                      width: 50,
                    ),
                  ),
                ),
                  // Image.asset(                 // [] 형태로 만들어서 일일이 추가해주는 방법
                  //   'images/${imageName[2]}',
                  //   width: 50,
                  // ),
              ),
            ),
            Text('Selected Item : ${imageName[selectedItem]}'),
            Image.asset(
              width: 300, // 크기를 정해줘야 fit을 써도 적용이됨
              height: 250,
              'images/${imageName[selectedItem]}',
              fit: BoxFit.contain,                   // fill(내가 지정한 사이즈에 맞춰줌)과 contain(원본 이미지의 비율을 생각)을 많이 사용
            ),
          ],
        ),
      ),
    );
  } // build
} // class

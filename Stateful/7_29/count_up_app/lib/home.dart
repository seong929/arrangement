import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late int count; // 클릭 누적 숫자

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count up"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 클릭수는 $count 입니다.'
            ),
            FloatingActionButton(
              onPressed: increaseond,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),   // 버튼 안에 + 아이콘 추가
            ),
            ElevatedButton(
              onPressed: increaseond,
              child: Text('2씩 증가'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseond,
        backgroundColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('증가'),   // Text를 Colunm으로 바꿔줌
          ],
        ),
      ),
    );
  } // build

  void increaseond(){
    count+=2;
    setState(() {});
  }
} // class
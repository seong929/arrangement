import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  // late List<String> todoList;
  late List<int> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  void addData(){
    // todoList.add('유비');
    // todoList.add('관우');
    // todoList.add('장비');
    // todoList.add('조조');
    // todoList.add('여포');
    // todoList.add('동탁');
    for(int i = 1; i < 1000; i++){    // 숫자 1000개 만들기
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
      ),
      body: Center(
        child: ListView.builder(      // 
        itemCount: todoList.length,
          itemBuilder: (context, index) { // 어디에 넣을지 확인, 몇번째 데이터인지 확인하기 위해 (왜쓰는지 알아두기)
            return SizedBox(
              height: 100,
              child: Card(    // cara에 sizedbox를 해줘서 크기 조정
                color: Colors.amber,
                child: Center(
                  child: Text(
                    todoList[index].toString(),   // 숫자니까 toString로 문자열로 변환시켜줘야함
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
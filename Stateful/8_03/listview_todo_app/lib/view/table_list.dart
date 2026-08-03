import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/util/message.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<TodoList> todoList;   // 내가 만든 모델을 사용

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  void addData(){
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));             // value에 사용하는게 todo_list.dart에서 생성한 생성자들임
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));       // value에 사용하는게 todo_list.dart에서 생성한 생성자들임
    todoList.add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));   // value에 사용하는게 todo_list.dart에서 생성한 생성자들임
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        actions: [    // 버튼을 누르면 insert 페이지로 넘어가는 기능
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/insert').then((value) => rebuildData(),), // insert 실행해서 insert 화면으로 가고 pop로 없어지면 .then부터 실행
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {   // 하나 만들고 메모리 추가하는 기능
            return GestureDetector(
              onTap: () {
                Message.workList = todoList[index].workList;    // message.dart에 들어감 저장소로 넣어주고 문자 사용
                Message.imagePath = todoList[index].imagePath;  // message.dart에 들어가고 이미지를 사용
                Navigator.pushNamed(
                  context, 
                  '/detail',
                );
              },
              child: SizedBox(    //sizedbox에 widget 추가
                height: 100,
                child: Card(    // card에 sizedbox 부여
                color: index % 2 == 0 // card는 index이기 때문에 삼항연산자를 사용해 짝수면 green 홀수면 red로 입혀줌
                ? Colors.green
                : Colors.red,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(   // image에 padding 부여
                          todoList[index].imagePath,  // property, 메서드, 생성자
                        ),
                      ),
                      Text(
                        '   ${todoList[index].workList}',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build

  void rebuildData(){
    if(Message.action){
    todoList.add(TodoList(imagePath: Message.imagePath, workList: Message.workList));
    Message.action = false;   // 입력할때만 true로 저장이 되고 입력을 안하면 false로 왔다갔다만 함
    setState(() {});
    }
  }

} // class
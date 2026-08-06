import 'package:flutter/material.dart';
import 'package:listview_app/model/todo_list.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late List<TodoList> animal;


  @override
  void initState() {
    super.initState();
    animal = [];
    addData();
  }

  
    void addData(){
    animal.add(TodoList(imagePath: "images/bee.png", animalName: "벌"));
    animal.add(TodoList(imagePath: "images/cat.png", animalName: "고양이"));
    animal.add(TodoList(imagePath: "images/cow.png", animalName: "소"));
    animal.add(TodoList(imagePath: "images/dog.png", animalName: "개"));
    animal.add(TodoList(imagePath: "images/fox.png", animalName: "여우"));
    animal.add(TodoList(imagePath: "images/monkey.png", animalName: "원숭이"));
    animal.add(TodoList(imagePath: "images/pig.png", animalName: "돼지"));
    animal.add(TodoList(imagePath: "images/wolf.png", animalName: "늑대"));
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: animal.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showAnimalDialog(context, index);
              },
              child: SizedBox(
                height: 100,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(animal[index].imagePath,
                      width: 100,
                      height: 100,),
                      Text("  ${animal[index].animalName}")
                    ],
                  ),
                      
                ),
              ),
            );
          },
          ),
      ),
    );
  }// build

  //=======================Funtion=======================
void _showAnimalDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(animal[index].animalName), // 클릭한 동물 이름 (예: 강아지)
        content: Text("이 동물은 ${animal[index].animalName} 입니다."), // 동물 분류 설명
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 파란색 버튼
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // 팝업창 닫기
            },
            child: const Text('종료'),
          ),
        ],
      );
    },
  );
}
}
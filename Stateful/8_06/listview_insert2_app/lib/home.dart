// 이 파일 안에서 first_page와 second_page를 둘 다 불러옴
import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';
import 'package:listview_insert_app/view/first_page.dart';
import 'package:listview_insert_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {  // tabbar 쓸때 필수로 써줘야함
  // Property
  late TabController controller;  // 탭바 or 탭바뷰를 사용할 수 있음
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this); // 개수와 어디랑 연결시킬건지 부여
    animalList = [];
    addList();  // 데이터를 추가하는 함수
  }

  void addList(){
    animalList.add(Animal(
      imagePath: 'images/bee.png', 
      animalName: '벌', 
      kind: '곤충', 
      flyExist: true));

    animalList.add(Animal(
      imagePath: 'images/cat.png', 
      animalName: '고양이', 
      kind: '포유류', 
      flyExist: false));
    
    animalList.add(Animal(
      imagePath: 'images/cow.png', 
      animalName: '젖소', 
      kind: '포유류', 
      flyExist: false));
    
    animalList.add(Animal(
      imagePath: 'images/dog.png', 
      animalName: '강아지', 
      kind: '포유류', 
      flyExist: false));
    
    animalList.add(Animal(
      imagePath: 'images/fox.png', 
      animalName: '여우', 
      kind: '포유류', 
      flyExist: false));
    
    animalList.add(Animal(
      imagePath: 'images/monkey.png', 
      animalName: '원숭이', 
      kind: '영장류', 
      flyExist: false));
    
    animalList.add(Animal(
      imagePath: 'images/pig.png', 
      animalName: '돼지', 
      kind: '포유류', 
      flyExist: false));
    
    animalList.add(Animal(
      imagePath: 'images/wolf.png', 
      animalName: '늑대', 
      kind: '포유류', 
      flyExist: false));
  }

  @override
  void dispose() {
    controller.dispose(); // 컨트롤러를 지우기위해
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Listview Test'),    // Text를 clounm으로 잡아줌
            Text(
              '전체 개수 : ${animalList.length}',
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.red,
          tabs: [
            Tab(
              text: 'Table',
              icon: Icon(
                Icons.reorder, 
                color: Colors.amber,
              ),
            ),
            Tab(
              text: 'Insert',
              icon: Icon(
                Icons.extension, 
                color: Colors.green,
              ),
            ),
          ], 
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList), // 다시 만드는거기 때문에 탭에서 돌아오면 체크가 없어져있음 
        ],
      ),
    );
  }
} 

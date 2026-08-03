import 'package:flutter/material.dart';
import 'package:tabbar_app/view/first_page.dart';
import 'package:tabbar_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{ // with SingleTickerProviderStateMixin을 해줘야 tabbar를 만들 수 있음
  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);  // length는 탭 개수, vsync 탭 기능을 어디에 넣을지 정하는 기능 home에 그대로 사용할거니 this 이용
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(    // appbar를 안써주면 페이지를 옮겨도 appbar 부분을 안나오게 할 수 있음
      //   title: Text('Tab Bar Test'),
      // ),
      body: TabBarView(   // controller 부터 함.
        controller: controller,
        children: [       // 더 있다면 추가해주면됨 line 19번의 length도 수정해 줄 것
          FirstPage(),    // 팀장들이 생성자를 정해주면 팀원들은 이 생성자를 이용해 페이지를 만들면됨
          SecondPage()
        ],
      ),
      bottomNavigationBar:Container(  // container을 쓰면 색깔을 입힐 수 있고 sizedbox을 사용해 크기를 감싸줘야함
        color: Colors.amber,
        
        height: 80,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,    // 선택된 탭의 색깔을 파란색으로 바꿔주는 역할
          indicatorColor: Colors.red, // 아이콘 하단의 색깔을 바꿔줌(탭의 위치를 알려주는 역할)
          indicatorWeight: 10,          // 위에서 설명한 부분의 크기를 정해주는 역할
          tabs: [
            Tab(
              icon: Icon(Icons.looks_one),
              text: 'One',
            ),
            Tab(
              icon: Icon(Icons.looks_two),
              text: 'Two',
            ),
          ],
        ),
      ),    
    );
  }
}


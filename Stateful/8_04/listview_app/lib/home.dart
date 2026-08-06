import 'package:flutter/material.dart';
import 'package:listview_app/view/first_page.dart';
import 'package:listview_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ListView Test'),
      // ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(),
          SecondPage()
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        // 여기까지가 컨테이너 환경을 만들어 줌
        // 내용 삽입
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          tabs: [
            Tab(
              icon: Icon(Icons.looks_one,),
            ),
            Tab(
              icon: Icon(Icons.looks_two),
            ),
          ],
        )
      )
    );
  }
}
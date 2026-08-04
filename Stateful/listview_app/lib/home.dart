import 'package:flutter/material.dart';
import 'package:listview_app/model/aniaml_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  // Property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);   // home.dart에 만들거니 this 이용
    animalList = [];
    addList();
  }

  void addList(){
    
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
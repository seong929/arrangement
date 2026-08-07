import 'package:collection_view_image_app/flower.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageList;

  @override
  void initState() {
    super.initState();

    imageList = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flower Garden'),
      ),
      body: GridView.builder(
        itemCount: imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ), 
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                GestureDetector(
                  onTap: () => Get.to(Flower(),arguments: imageList[index]),
                  child: Card(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,  // 글씨가 가운데로
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/${imageList[index]}',
                                width: 100,
                              ),
                            ),
                            RotationTransition(
                              turns: AlwaysStoppedAnimation(-45/360),
                              child: Text(
                                'All rights reserved!',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          imageList[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
          );
        },
      ),
    );
  }
}
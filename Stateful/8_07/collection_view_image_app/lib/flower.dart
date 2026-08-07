import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  State<Flower> createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  // Property
  late String imageName;

  @override
  void initState() {
    super.initState();

    imageName = Get.arguments ?? '__';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(imageName),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'images/$imageName',
            width: 300,
          ),
        ),
      ),
    );
  }
}

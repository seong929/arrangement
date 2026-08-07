  // 입력 화면
  import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertHero extends StatefulWidget {
  const InsertHero({super.key});

  @override
  State<InsertHero> createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  // Property
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인물 추가하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: '인물을 추가 하세요.'  // hintText는 글자가 있다가 클릭하면 없어짐
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String resultMessage = '';  // 데이터가 있으면 쓸거고 ''이면 안쓴다는 의미
                if(nameController.text.trim().isNotEmpty){  
                  resultMessage = nameController.text.trim();
                }

                Get.back(result: resultMessage);


              }, 
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
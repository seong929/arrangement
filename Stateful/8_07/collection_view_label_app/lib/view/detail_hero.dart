  // 내용 보기
  import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailHero extends StatefulWidget {
  const DetailHero({super.key});

  @override
  State<DetailHero> createState() => _DetailHeroState();
}

class _DetailHeroState extends State<DetailHero> {
  // Property
  late String heroName;

  @override
  void initState() {
    super.initState();
    heroName = Get.arguments ?? '__'; // 앞에서 넘겨온 argument를 이용 널이면 __
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인물 보기'),
      ),
      body: Center(
        child: Text(heroName),  // 앞에서 클릭한걸 가져오게함
      ),
    );
  }
}
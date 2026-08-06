import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/home.dart';
import 'package:getx_intro_app/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Get를 추가하고 ★★★★ get/get.dart import하기
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(), // 처음은 home이 나와서 그대로 사용
      getPages: [         // Get.to()로 페이지 이동하는 방법 대신에 사용할 수도 있음
        GetPage(
          name: '/third', 
          page: () => ThirdPage(),
        ),
        GetPage(
          name: '/third2', 
          page: () => ThirdPage(),
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 2),
        ),
      ],
    );
  }
}


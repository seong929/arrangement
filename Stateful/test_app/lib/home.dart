import 'package:flutter/material.dart';
// 보안 때문에 2개의 클래스로 나뉨
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(class에서 쓸 전역변수들 설정)
  late String title;      // late는 지금은 없지만 나중에 설정해준다는 의미
  late Color appBarColor; // 여기서 변수로 따로 설정해주기때문에 아래에서도 변수를 사용해야함
  late String click;      // 버튼 클릭시 버튼 내용이 바뀜
  late String change;     // 버튼 클릭시 사진이 바뀜

  bool check = true;

  @override // ini 치면 override 나옴
  void initState() {
    super.initState();
    title = "Smile";
    appBarColor = Colors.amber;
    click = "ok";
    change = 'smile.png';
    check = true;
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),           // 위에서 정의한 title을 사용
        backgroundColor: appBarColor, // 위에서 정의한 appBarColor을 사용
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/$change',
              width: 100,
            ),
            ElevatedButton(
              onPressed: () {
                if(check){
                  title = 'Pikachu';   // 바꼈다고는 하지만 실질적으론 안바뀜
                  appBarColor = Colors.green;
                  click = '바뀌었습니다.';
                  change = 'pikachu-1.jpg';
                  check = false;
                }else{
                  title = 'Smile';   // 바꼈다고는 하지만 실질적으론 안바뀜
                  appBarColor = Colors.amber;
                  click = 'ok';
                  change = 'smile.png';
                  check = true;
                }
                print(title);
                setState(() {});
              }, 
              child: Text(click),
            ),
          ],
        ),
      ),
    );
  }
}
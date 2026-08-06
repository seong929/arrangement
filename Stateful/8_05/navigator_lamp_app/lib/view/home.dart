// 첫번째 화면
import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/util/message.dart';
import 'package:navigator_lamp_app/view/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late TextEditingController textEditingController;  // 
  late String lmapImage;

  @override
  void initState() {  // late를 사용했으니 초기값을 주는 init을 사용해야함
    super.initState();
    textEditingController = TextEditingController();  // 첫화면에 들어갈 데이터
    lmapImage = 'images/lamp_on.png';                 // 첫화면에 들어갈 데이터
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main 화면'),
        actions: [  // actions를 써야 아이콘 사용 가능
          IconButton(
            onPressed: () { // 2번째 화면으로 넘어갈 수 있게
              Message.contents = textEditingController.text; // 입력한걸 다음페이지로 넘겨줄려고 사용하고 다음 페이지에서 그대로 확인할 수 있음
              Navigator.push(
                context,    // 어디까지 실행했는지 알 수 있게해줌 
                MaterialPageRoute(
                  builder: (context) => Controller(),   // 2번째 페이지를 만들기 위해 // home.dart에서 controller을 만들어서 넘어갈 수 있게해줌
                ),
              ).then((value) => getData(),);  // 2페이지에서 수정한걸 받기위해 .then 사용
            }, 
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [   // 리스트라 ,로 구분하는 것
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: '글자를 입력하세요', // labelText는 타입이 String이므로 String만 줌
                ),
              ),
            ),
            Image.asset(  // asset은 같은 프로젝트 안에 있는 폴더 사용
              lmapImage,
              width: 150,
            ),
          ],
        ),
      ),
    );
  } // build

  // ---Functions ---
  void getData(){
    textEditingController.text = Message.contents; // 무엇을 바꾼지 모르니까 Message.contents 사용
    lmapImage = Message.lampStatus ? 'images/lamp_on.png' : 'images/lamp_off.png';
    setState(() {});
  }


} // class

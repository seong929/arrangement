import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textEditingController;   // 텍스트필드 개수에 따라 추가해야함
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String result;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Textfield'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(    // Column에 패딩을 넣어서 글자가 보이게 해줌
          children: [
            TextField(    // 텍스트 필드는 디자인임
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: '글자를 입력하세요.',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text, // 키보드 형태를 정해줌 숫자만 or 텍스트만
            ),
            ElevatedButton(
              onPressed: inputCheck, 
              child: Text('출력'),
            ),
            Divider(),
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                labelText: '숫자를 입력하세요',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(
                labelText: '숫자를 입력하세요',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: addAction, 
              child: Text('덧셈 계산'),
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---Functions---
  void inputCheck(){
    if(textEditingController.text.trim().isEmpty){   // 글씨 적힌게 업을시(보안 때문에 스페이스바, 숫자도 문자로 인식함), trim()은 앞, 뒤의 스페이스를 없애줌
      // errorSnackBar();
      _snackBar('글자를 입력 하세요', Colors.red);
    }else{
      // showSnackBar();
      _snackBar('입력한 글자는 ${textEditingController.text.trim()} 입니다.', Colors.blue);
    }
  }

  void _snackBar(String message, Color color){      // 함수를 1개만 사용할 때 사용
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: color,
      )
    );
  }

  // void errorSnackBar(){   // 글씨를 입력하지 않을시 스낵바 출현
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('글자를 입력 하세요.'),
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Colors.red,
  //     )
  //   );
  // }

  // void showSnackBar(){     // 글씨를 입력했을 경우 입력한걸 다시 보여주는 역할
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('입력한 글자는 ${textEditingController.text.trim()} 입니다.'),
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Colors.blue,
  //     )
  //   );
  // }

  void addAction(){   // 숫자 입력칸에 둘 다 입력을 해야 정상적으로 작동 아닌경우 스낵바 생성
    if(num1Controller.text.trim().isNotEmpty && num2Controller.text.trim().isNotEmpty){
    int num1 = int.parse(num1Controller.text.trim()); // 문자열을 정수형으로 변환시켜주는 기능
    int num2 = int.parse(num2Controller.text.trim()); 
    int sum = num1 + num2;

    result = '$num1 + $num2 = $sum';
    setState(() {});
    }else{
      _snackBar('숫자를 입력하세요', Colors.red);
    }
  }

} // class
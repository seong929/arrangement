import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  late TextEditingController num1controller;
  late TextEditingController num2controller;

  late TextEditingController subcontroller;
  late String result;

  @override
  void initState() {
    super.initState();
    num1controller = TextEditingController();
    num2controller = TextEditingController();
    subcontroller = TextEditingController();
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: num1controller,
              decoration: InputDecoration(
                labelText: '첫번째 숫자를 입력하세요.',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2controller,
              decoration: InputDecoration(
                labelText: '두번째 숫자를 입력하세요.',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: subAction,
              child: Text('Ok'),
            ),
            TextField(
              controller: subcontroller,
              decoration: InputDecoration(
                labelText: '뺄셈 결과',
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
    );
  }

  void subAction(){
    int num1 = int.parse(num1controller.text.trim());
    int num2 = int.parse(num2controller.text.trim());

    int subresult = num1 - num2;

    subcontroller.text = subresult.toString();
    result = '$num1 + $num2 = $subresult';
    setState(() {});


  }
}
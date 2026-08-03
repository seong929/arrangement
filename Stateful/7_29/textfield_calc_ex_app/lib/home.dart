import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  // 텍스트칸이 총 6개 이므로 6개의 TextEditingController 선언
  late TextEditingController num1controller;  // 첫번째 숫자 입력
  late TextEditingController num2controller;  // 두번째 숫자 입력
  
  late TextEditingController addcontroller;  // 덧셈 결과
  late TextEditingController subcontroller;  // 뺄셈 결과
  late TextEditingController mulcontroller;  // 곱셈 결과
  late TextEditingController divcontroller;  // 나눗셈 결과

  @override
  void initState() {    // 첫 화면 실행화면이고 한 번 실행되고 다시는 실행X
    super.initState();
    num1controller = TextEditingController();
    num2controller = TextEditingController();
    addcontroller = TextEditingController();
    subcontroller = TextEditingController();
    mulcontroller = TextEditingController();
    divcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {    // build는 화면 그려주는 역할
    return Scaffold(
      appBar: AppBar(
        title: Text('간단한 계산기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(  // column에 padding을 부여
          children: [
            TextField(    // TextField는 controller부터 선언
              textAlign: TextAlign.end,
              controller: num1controller,
              decoration: InputDecoration(
                labelText: '첫번째 숫자를 입력하세요.',
                border: OutlineInputBorder(), // 테두리가 보이는 기능
              ),
              keyboardType: TextInputType.number, // 쿼티 키보드가 아닌 숫자 키보드로 나오는 기능
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.end,    // 숫자는 우측 정렬 문자는 좌측 정렬
              controller: num2controller,
              decoration: InputDecoration(
                labelText: '두번째 숫자를 입력하세요.',
                border: OutlineInputBorder(), 
              ),
              keyboardType: TextInputType.number, 
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(   // row에 padding 부여
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: calcAction,
                    child: Text('계산하기'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: removeAction,
                    child: Text('지우기'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(    
              controller: addcontroller,
              decoration: InputDecoration(
                labelText: '덧셈 결과',
              ),
              readOnly: true, // 읽기 전용이라 키보드는 따로 안해줘도됨
            ),
            TextField(    
              controller: subcontroller,
              decoration: InputDecoration(
                labelText: '뺄셈 결과',
              ),
              readOnly: true, 
            ),
            TextField(    
              controller: mulcontroller,
              decoration: InputDecoration(
                labelText: '곱셈 결과',
              ),
              readOnly: true, 
            ),
            TextField(    
              controller: divcontroller,
              decoration: InputDecoration(
                labelText: '나눗셈 결과',
              ),
              readOnly: true, 
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  void calcAction(){    // num1controller, num2controller이 입력했는지 확인하는 기능
    if(num1controller.text.trim().isEmpty || num2controller.text.trim().isEmpty){
      errorSnackbar();
    }else{
      calcResult();
    }
  }

  void errorSnackbar(){   // num1controller, num2controller 입력 안했을때 스낵바 기능
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('숫자를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  void calcResult(){
    int num1 = int.parse(num1controller.text);
    int num2 = int.parse(num2controller.text);

    int addResult = num1 + num2;
    int subResult = num1 - num2;
    int mulResult = num1 * num2;

    addcontroller.text = addResult.toString();  // 숫자를 text로 바꿔줘야함
    subcontroller.text = subResult.toString();
    mulcontroller.text = mulResult.toString();

    // 나눗셈의 결과는 실수, 분모가 0인 경우에는 계산할 수 없음
    if(num2 == 0){
      divcontroller.text = 'Impossible';
    }else{
      double divResult = num1 / num2;
      divcontroller.text = divResult.toString();
    }
  }

  void removeAction(){
    num1controller.text = '';
    num2controller.text = '';
    addcontroller.text = '';
    subcontroller.text = '';
    mulcontroller.text = '';
    divcontroller.text = '';
  }

} // class
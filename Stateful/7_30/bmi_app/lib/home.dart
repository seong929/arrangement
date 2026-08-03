import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController heightcontroller;
  late TextEditingController weightcontroller;
  late String figure;

  @override
  void initState() {
    super.initState();
    heightcontroller = TextEditingController();
    weightcontroller = TextEditingController();
    figure = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('BMI 계산기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: heightcontroller,
              decoration: InputDecoration(
                labelText: '신장을 입력하세요 (단위 :cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: weightcontroller,
              decoration: InputDecoration(
                labelText: '몸무게를 입력하세요 (단위: kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calcFunction();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text('BMI 계산'),
            ),
            SizedBox(height: 30),
            Text(
              figure,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Function ---
  void calcFunction(){
    if(heightcontroller.text.trim().isEmpty || weightcontroller.text.trim().isEmpty){
      errorSnackBar();
    }else{
      calcAction();
    }
  }

  void calcAction(){
    String resultStr;
    double doubleWeight = double.parse(weightcontroller.text.trim()); // weight를 실수형으로 변환
    double doubleHeight = double.parse(heightcontroller.text.trim()) / 100;

    // BMI 공식
    double bmi = double.parse((doubleWeight / (doubleHeight * doubleHeight)).toStringAsFixed(1));
    if (bmi <= 18.4) {
      resultStr = '저체중';
    } else if (bmi <= 22.9) {
      resultStr = '정상체중';
    } else if (bmi <= 24.9) {
      resultStr = '과체중';
    } else if (bmi <= 29.9) {
      resultStr = '비만';
    } else {
      resultStr = '고도비만';
    }

    figure = '귀하의 bmi지수는 $bmi이고 $resultStr 입니다.';
    setState(() {});
  }

  void errorSnackBar(){

  }
}
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
  late String showimage;

  @override
  void initState() {
    super.initState();
    heightcontroller = TextEditingController();
    weightcontroller = TextEditingController();
    figure = '';
    showimage = 'images/bmi.jpg';
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
      body: SingleChildScrollView(
        child: Padding(
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
              Image.asset(
                showimage,
                width: 200,
              ),
            ],
          ),
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
    double doubleWeight = double.parse(weightcontroller.text.trim()); 
    double doubleHeight = double.parse(heightcontroller.text.trim()) / 100;

    double bmi = double.parse((doubleWeight / (doubleHeight * doubleHeight)).toStringAsFixed(1));
    if (bmi <= 18.4) {
      resultStr = '저체중';
      showimage = 'images/bmi1.jpg';
    } else if (bmi <= 22.9) {
      resultStr = '정상체중';
      showimage = 'images/bmi2.jpg';
    } else if (bmi <= 24.9) {
      resultStr = '과체중';
      showimage = 'images/bmi3.jpg';
    } else if (bmi <= 29.9) {
      resultStr = '비만';
      showimage = 'images/bmi4.jpg';
    } else {
      resultStr = '고도비만';
      showimage = 'images/bmi5.jpg';
    }

    figure = '귀하의 bmi지수는 $bmi이고 $resultStr 입니다.';
    setState(() {});
  }

  void errorSnackBar(){

  }
}
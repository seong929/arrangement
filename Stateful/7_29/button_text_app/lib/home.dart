import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(코멘트 달아주기)
  late String buttonText; // 버튼의 결과 텍스트
  late bool buttonState;  // 버튼의 횟수 판단


  @override
  void initState() {
    super.initState();
    buttonText = 'OFF';
    buttonState = false;
    print('================>> initstate()를 구동했습니다.');
  }

  @override
  Widget build(BuildContext context) {
    print('================>> build()를 구동했습니다.');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Life Cycle'),  // const를 넣으면 신경을 안씀
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              child: const Text('버튼을 누르세요'),
            ),
            Text(
              '버튼 상태: $buttonText'
            ),
          ],
        ),
      )
    );
  } //build

  // --- Functions ---
  // -----------------------------------------------
  // Date   :
  // 기능   : 버튼 상태를 OFF와 ON을 Toggle(왔다갔다)한다.
  // Author :

  // void _onClick(){
  //   print('================>> _onClick()를 구동했습니다.');
  //   if(buttonState == false){
  //     buttonText = 'On';
  //     buttonState = true;
  //   }else{
  //     buttonText = 'OFF';
  //     buttonState = false;
  //   }
  //   setState(() {});
  // }
  
  void _onClick(){
    print('================>> _onClick()를 구동했습니다.');
    if(buttonState == false){
      buttonText = 'On';
      buttonState = true;
    }else{
      buttonText = 'OFF';
      buttonState = false;
    }
    setState(() {});
  }

} // class
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String lampImage;
  late bool lampState;

  @override
  void initState() {
    super.initState();
    lampImage = 'images/lamp_on.png';
    lampState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Alert를 이용한 메세지 출력'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              lampImage,
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: turnon, 
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('켜기'),
                ),
                SizedBox(width: 30,),
                ElevatedButton(
                  onPressed: turnoff,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),                  
                  child: Text('끄기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void turnon(){
    if(lampState){
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('현재 램프가 켜진 상태 입니다.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text(
                    '네, 알겠습니다',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }else{
      lampState = true;
      lampImage = 'images/lamp_on.png';
      setState(() {});
    }
  }

  void turnoff(){
    if(lampState){
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('램프를 끄시겠습니까?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      lampImage = 'images/lamp_off.png';
                      lampState = false;
                      setState(() {});
                      Navigator.pop(context);
                    }, 
                    child: Text(
                      '네',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: Text(
                      '아니요',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('현재 램프가 꺼진 상태 입니다.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text(
                    '네, 알겠습니다',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }  

}
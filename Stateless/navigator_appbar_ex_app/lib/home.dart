import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/second.dart';
import 'package:navigator_appbar_ex_app/third.dart';

class Home extends StatelessWidget {
  const Home({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text('Navigator_AppBar'),
        centerTitle: false,
        actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SendMail();
                },));
              }, 
              icon: Icon(Icons.email),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ReceivedMail();
                },));
              }, 
              icon: Icon(Icons.email_outlined),
            ),

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {    // 첫번째 페이지 위치를 알려주고, 세컨 페이지 위치를 설정
                  return SendMail();
                },));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ), 
              child: Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ReceivedMail();
                },));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ), 
              child: Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator_AppBar'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => mailroute(context, '/send'), 
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () => mailroute(context, '/receive'), 
            icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => mailroute(context, '/send'),
              child: Text('보낸편지함'),
            ),
            ElevatedButton(
              onPressed: () => mailroute(context, '/receive'), 
              child: Text('받은편지함'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  // pushname의 위치를 받아 navigator를 사용하는 함수
  void mailroute(BuildContext context, String route){   // 함수 1개로 하는 방법
    Navigator.pushNamed(context, route);
  }

  // void mailroute(BuildContext ctx, String route){   
  //   Navigator.pushNamed(ctx, route);
  // }

  // void sendmail(BuildContext context){               // 함수 2개로 하는 방법
  //   Navigator.pushNamed(context, '/send');
  // }
  // void Receivedmail(BuildContext context){
  //   Navigator.pushNamed(context, '/receive');
  // }






} // class
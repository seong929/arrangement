import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert and push'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
        body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text(    
            'Move the 2nd page.'
          ),
        ),
      ),
    );
  } // build

  void _showDialog(BuildContext context){  
    showDialog(
      context: context,
      barrierDismissible: false,          
      // barrierColor: Colors.amber[100], 
      builder: (context){
        return AlertDialog(
          title: Text('Page 이동'),
          content: Text('아래의 버튼을 누르면\n페이지 이동을 합니다.'),  
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () => SeconPage(context), 
              child: Text('Page 이동'),
            ),
          ],
        );
      },
    );
  }

  void SeconPage(BuildContext context){
    Navigator.pop(context);  // 이렇게 2개를 넣어줘야 alert 창이 없어지면서 다음창으로 넘어가게됨 
    Navigator.pushNamed(context, '/send');
  }
} // class
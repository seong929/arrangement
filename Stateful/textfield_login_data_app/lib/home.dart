import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();   //userIdcontroller는 객체
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(
                labelText: '사용자 ID를 입력 하세요.'
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '패스워드를 입력 하세요.'
              ),
              obscureText: true, // 입력을 해도 안보이게 설정
            ),
            ElevatedButton(
              onPressed: checkData, 
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  void checkData(){
    if(userIdController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
      errorSnackBar();
    }else{
      if(userIdController.text.trim() == 'apple' && passwordController.text.trim() == '4321'){
        _showDialog();
      }else{
        checkSnackBar();
      }
    }
  }

  void _showDialog(){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('환영 합니다.'),
          content: Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                String id = userIdController.text.trim();   // 아이디를 가져가는 기능
                userIdController.text = '';   // 해줘야 다시와도 Id가 안보이게함
                passwordController.text = ''; // 해줘야 다시와도 password가 안보임
                Navigator.of(context).pop();

                Navigator.push(
                  context, 
                  MaterialPageRoute(    // 2번째 페이지를 만들어주고 넘어감
                    builder: (context) {  // builder는 return 무조건 해줘야함
                      return Second(id: id);
                    },
                  ),
                );
              }, 
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  void errorSnackBar(){ // errorSnackBar와 checkSnackBar을 하나로 묶어서 할 수 있음
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('사용자 ID와 암호를 입력 하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }

  void checkSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('사용자 ID와 암호가 일치 하지 않습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
    );
  }
} // class
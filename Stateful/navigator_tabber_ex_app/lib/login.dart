import 'package:flutter/material.dart';
import 'package:navigator_tabber_ex_app/second.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController userIdcontroller;
  late TextEditingController passwordcontroller;

  @override
  void initState() {
    super.initState();
    userIdcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void dispose(){
    userIdcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log in'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userIdcontroller,
              decoration: InputDecoration(
                labelText: '사용자 ID 입력하세요.',
              ),
            ),
            TextField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '패스워드를 입력하세요.',
              ),
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

  void checkData(){
    if(userIdcontroller.text.trim().isEmpty || passwordcontroller.text.trim().isEmpty){
      errorSnackBar();
    }else{
      if(userIdcontroller.text.trim() == 'root' && passwordcontroller.text.trim() == '654321'){
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
                String id = userIdcontroller.text.trim();   // 아이디를 가져가는 기능
                userIdcontroller.text = '';   // 해줘야 다시와도 Id가 안보이게함
                passwordcontroller.text = ''; // 해줘야 다시와도 password가 안보임
                Navigator.of(context).pop();

                Navigator.push(
                  context, 
                  MaterialPageRoute(    // 2번째 페이지를 만들어주고 넘어감
                    builder: (context) {  // builder는 return 무조건 해줘야함
                      return Second(id: id,);
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
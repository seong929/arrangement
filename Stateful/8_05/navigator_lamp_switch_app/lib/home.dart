import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/controller.dart';
import 'package:navigator_lamp_switch_app/util/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late String lampImage;

  @override
  void initState() {
    super.initState();
    lampImage = 'images/lamp_on.png'; // 첫 화면
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Controller(),
                ),
              ).then((value) => getData(),);
            }, 
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          lampImage,
          width: 150,
        ),
      ),
    );
  } // build

  void getData(){
    if(Message.lampStatus == false){
      lampImage = 'images/lamp_off.png';
    }else if(Message.redStatus == true){
      lampImage = 'images/lamp_red.png';
    }else{
      lampImage = 'images/lamp_on.png';
    }
    setState(() {});
  }


} // class
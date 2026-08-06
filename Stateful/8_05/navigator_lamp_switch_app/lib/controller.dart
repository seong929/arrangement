import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/util/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late bool redSwitchValue;
  late bool lampSwitchValue;

  @override
  void initState() {
    super.initState();
    redSwitchValue = Message.redStatus;
    lampSwitchValue = Message.lampStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('수정화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    redSwitchValue ? 'Red' : 'Yellow',
                  ),
                ),
                Switch(
                  value: redSwitchValue, 
                  onChanged: (value) {
                    redSwitchValue = value;
                    setState(() {});
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      lampSwitchValue ? 'ON' : 'OFF',
                    ),
                  ),
                  Switch(
                    value: lampSwitchValue, 
                    onChanged: (value) {
                      lampSwitchValue = value;
                      setState(() {});
                    },)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Message.redStatus = redSwitchValue;
                  Message.lampStatus = lampSwitchValue;
                  Navigator.pop(context);
                }, 
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
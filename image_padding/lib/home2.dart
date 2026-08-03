import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset('images/pikachu-1.jpg', width: 100,),
                    Text('pikachu-1')
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/pikachu-1.jpg', width: 100,),
                  Text('pikachu-2')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Image.asset('images/pikachu-1.jpg', width: 100,),
                    Text('pikachu-3')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
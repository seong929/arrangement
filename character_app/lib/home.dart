import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[700],
      appBar: AppBar(
        title: Text('영웅 Card'),
        backgroundColor: Colors.amber[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/Lee.jpg',
                ),
                radius: 70,
              ),
            ),
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Text(
              '성웅',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            Text(
              '이순신 장군',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '전적',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '62전 62승',
              style: TextStyle(
                color: Colors.red,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    옥포해전')
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    사천포해전')
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    당포해전')
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    한산도대첩')
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    부산포해전')
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    명량해전')
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('    노량해전')
              ],
            )
          ],
        ),
      ),
    );
  }
}
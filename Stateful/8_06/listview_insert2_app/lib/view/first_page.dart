import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';
// 실질적으로 다음 페이지로 넘어가는건 아님
class FirstPage extends StatefulWidget {
  final List<Animal> list;    // 필수
  const FirstPage({super.key, required this.list}); // required this.list 필수

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView.builder(
        itemCount: widget.list.length,    // 개수가 나옴
        itemBuilder: (context, index) {
          return Card(  // 카드모양을 만든다는 의미
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.list[index].imagePath),
                    radius: 40,
                  ),
                ),
                Text('      ${widget.list[index].animalName} / ${widget.list[index].kind}'), // 텍스트가 나오게 // index는 해당 순서에 있는걸로 만들기 위해
              ],
            ),
          );
        },
      ),
    );
  }
}
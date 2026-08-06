import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;    
  const FirstPage({super.key, required this.list}); // 생성할때 super.key, required this.list 규격을 맞춰야 생성 가능함

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length, // 위젯에 있는 list의 length을 사용 (위젯을 사용하면 line 5번 클래스를 이용함) 
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showDialog(index),  // 클릭할거니까 ontap 사용
              child: Card( // 카드를 만드는 기능 card에 widget(gestureDetector) 부여
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                    ),
                    Text('    ${widget.list[index].animalName}')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build

  // --- Functions ---
  void _showDialog(int index){
    showDialog(
      context: context, 
      barrierDismissible: false,    // 버튼 누를때만 ~을 할것이다라는 기능
      builder: (context) {
        return AlertDialog(
          title: Text(
            widget.list[index].animalName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          content: Row(
            children: [
              Image.asset(
                widget.list[index].imagePath,
                width: 50,
              ),
              Text(
                '  이 동물은 ${widget.list[index].kind} 입니다. \n'
                '  이 동물은 ${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다."}'
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('종료'),
            ),
          ],
        );
      },
    );
  }


} // class
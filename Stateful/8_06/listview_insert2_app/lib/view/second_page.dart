import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_insert_app/model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late TextEditingController nameController;  // TextEditingController은 변수 뒤에 Controller로 정의해주는게 좋음
  late int _radioValue;
  late bool flyExist;
  late String _imagePath;
  late List<Color> animalColor;
  
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = '';
    animalColor = [];
    
    for(int i = 0; i < widget.list.length; i++){  // 개수만큼 색깔도 만들어짐
      animalColor.add(Colors.yellow);           
      }
    }
  
  void initColor(){
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: '등록할 동물 이름을 입력 하세요.'
              ),
              keyboardType: TextInputType.text,
              maxLength: 20,
              maxLines: 1,
            ),
            RadioGroup(
              groupValue: _radioValue,
              onChanged: (value) {  // 사용자가 바꿨을때
                _radioValue = value!; // ?니까 !로 해제
                setState(() {});  // 안해주면 입력하기 전까지 안바뀜
              }, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(value: 0), // 누르면 value가 line 49에 저장되고 line 50으로 넘어감
                  Text('양서류'),
                  Radio(value: 1),
                  Text('파충류'),
                  Radio(value: 2),
                  Text('포유류'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('날 수 있나요?'),
                Checkbox( // 다중 선택은 Checkbox, 단일 선택은 radioGroup
                  value: flyExist, 
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // 좌우로 스크롤하는 기능
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => rebuildBorder(index),
                    child: Container( // container에 widget(GestureDetector) 부여해서 클릭할 수 있게해줌
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: animalColor[index],
                          width: 2 // 테두리를 두껍게 
                        )
                      ),
                      child: Image.asset( //image를 container로 감싸줌
                        widget.list[index].imagePath,
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => _showDialog(),
              child: Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---Functions---
  void rebuildBorder(int index){      // int index 때문에 사용자가 어느걸 선택했는지 알 수 있음
  for(int i = 0; i < widget.list.length; i++){  // 체크한거만 빨간색으로 
    animalColor[i] = Colors.yellow;
  }

  animalColor[index] = Colors.red;  
  _imagePath = widget.list[index].imagePath;

  setState(() {});
  }

  void _showDialog(){   // 전역변수기 때문에 그냥 사용해도됨
    Animal animal = Animal(
      imagePath: _imagePath, 
      animalName: nameController.text.trim(), 
      kind: getKind(_radioValue), 
      flyExist: flyExist,
    );

    Get.defaultDialog(
      title: '동물 추가하기',
      middleText: '이 동물은 ${animal.animalName} 입니다.\n'  // 내용
      '또 동물의 종류는 ${animal.kind} 입니다.\n'
      '이 동물은 ${animal.flyExist ? '날 수 있습니다.' : '날 수 없습니다.'}\n\n'
      '이 동물을 추가 하시겠습니까?',
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                widget.list.add(animal);
                animalColor.add(Colors.yellow);

                // 초기화
                nameController.text = '';
                _radioValue = 0;
                flyExist = false;
                _imagePath = '';

                Get.back();
              }, 
              child: Text('예'),
            ),
            TextButton(
              onPressed: () => Get.back(), 
              child: Text('아니요'),
            ),
          ],
        )
      ]
    );
  }

  String getKind(int radioValue){
    String kind = '';
    switch(radioValue){
      case 1:
      kind = '파충류';
      case 2:
      kind = '포유류';
      default:
      kind = '양서류';
    }

    return kind;
  }

} // class
import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late TextEditingController nameController;  // 동물 이름 입력값 관리
  late int _radioValue;                       // 선택한 동물 종류의 번호 저장 ex) 0 = 양서류
  late bool flyExist;                         // 날 수 있는지 확인
  late String _imagePath;                     // 선택한 동물 이미지 경로 저장
  late String imageName;                      // 선택한 동물 이미지 이름 저장

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false; // 체크박스에 체크 안되어있음
    _imagePath = '';
    imageName = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(    // 동물 이름을 최대 20글자로 제한
              controller: nameController,
              maxLength: 20, 
              maxLines: 1,
            ),
            RadioGroup(   // 라디오 버튼으로 동물 종류를 하나 선택
              groupValue: _radioValue,  
              onChanged: (value) {
                _radioValue = value!;
                setState(() {});
              }, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,  // radio 버튼 생성
                children: [
                  Radio(value: 0),
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
                Checkbox(   // Check 여부에 따라 날 수 있는지 저장
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
              child: ListView(  // Listview는 만드는게 아니라 있는걸 사용(데이터 추가 불가능) // 아니면 ListBuilder를 사용해야함
                scrollDirection: Axis.horizontal, // 좌우로 움직이게 해줌
                children: [
                  GestureDetector(
                    onTap: () {   // 이미지를 누르면 해당 이미지의 경로와 이름을 저장
                      _imagePath = 'images/cow.png';
                      imageName = '젖소';
                      setState(() {});
                    },
                    child: Image.asset( // image에 widget(gesturedetector) 부여
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/pig.png';
                      imageName = '돼지';
                      setState(() {});
                    },
                    child: Image.asset( 
                      'images/pig.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/bee.png';
                      imageName = '벌';
                      setState(() {});
                    },
                    child: Image.asset( 
                      'images/bee.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/cat.png';
                      imageName = '고양이';
                      setState(() {});
                    },
                    child: Image.asset( 
                      'images/cat.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/fox.png';
                      imageName = '여우';
                      setState(() {});
                    },
                    child: Image.asset( 
                      'images/fox.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/monkey.png';
                      imageName = '원숭이';
                      setState(() {});
                    },
                    child: Image.asset( 
                      'images/monkey.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Text(imageName),
            ElevatedButton(
              onPressed: () => _showDialog(), 
              child: Text('동물 추가하기'),
            )
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  void _showDialog(){
    var animal = Animal(      // var는 데이터를 보고 타입을 정해줌 정해진 타입은 못바꿈, animal은 객체 Animal은 생성자
      imagePath: _imagePath,  // 사용자가 입력한 값으로 새로운 Animal 객체를 만들어줌
      animalName: nameController.text.trim(), 
      kind: getKind(_radioValue),   
      flyExist: flyExist,
    );

    showDialog(   // 동물을 추가할지 확인하는 팝업창
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '이 동물은 ${animal.animalName} 입니다.\n'
            '또 이 동물의 종류는 ${animal.kind} 입니다.'
            '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n\n'
            '이 동물을 추가 하시겠습니까?'
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(animal);      // 전달받은 기존 리스트에 입력한 동물을 추가
                Navigator.of(context).pop();
              }, 
              child: Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('아니요'),
            ),
          ],
        );
      },
    );
  }

  String getKind(int radioValue){   // 라디오 번호를 문자열 종류로 변화 ex) 0 -> 양서류
    String returnValue = '';
    if(radioValue == 0){
      returnValue = '양서류';
    }else if(radioValue == 1){
      returnValue = '파충류';
    }else{
      returnValue = '포유류';
    }

    return returnValue;
  }

} // class
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_grid_insert_app/model/animal_list.dart';

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

  // PickerView에서 사용할 리스트
  late List<String> imageList;
  late List<String> imageNameList;
  late int selectedItem;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false; // 체크박스에 체크 안되어있음

    // PickerView에서 사용할 이미지
    imageList = [
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png',
    ];

    // 이미지 이름
    imageNameList = [
      '벌',
      '고양이',
      '젖소',
      '강아지',
      '여우',
      '원숭이',
      '돼지',
      '늑대',
    ];

    // 처음 선택되는 이미지 번호
    selectedItem = 0;

    // 처음 화면에서 젖소가 선택되어 있음
    _imagePath = imageList[selectedItem];
    imageName = imageNameList[selectedItem];
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              // 동물 이름을 최대 20글자로 제한
              controller: nameController,
              maxLength: 20,
              maxLines: 1,
            ),

            RadioGroup(
              // 라디오 버튼으로 동물 종류를 하나 선택
              groupValue: _radioValue,
              onChanged: (value) {
                _radioValue = value!;
                setState(() {});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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

                Checkbox(
                  // Check 여부에 따라 날 수 있는지 저장
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),

            // 이미지 선택 PickerView
            SizedBox(
              width: 200,
              height: 180,
              child: CupertinoPicker(
                itemExtent: 80,
                onSelectedItemChanged: (value) {
                  selectedItem = value;
                  // 선택한 이미지 경로와 이름 저장
                  _imagePath = imageList[selectedItem];
                  imageName = imageNameList[selectedItem];

                  setState(() {});
                },

                children: List.generate(
                  imageList.length,
                  (index) => Center(
                    child: Image.asset(
                      imageList[index],
                      width: 70,
                    ),
                  ),
                ),
              ),
            ),

            // 현재 선택한 동물 이미지 이름
            Text(imageName),

            ElevatedButton(
              onPressed: () => _showDialog(),
              child: Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  void _showDialog() {
    var animal = Animal(
      // 사용자가 입력한 값으로 새로운 Animal 객체를 만들어줌
      imagePath: _imagePath,
      animalName: nameController.text.trim(),
      kind: getKind(_radioValue),
      flyExist: flyExist,
    );

    showDialog(
      // 동물을 추가할지 확인하는 팝업창
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
            '또 이 동물의 종류는 ${animal.kind} 입니다.\n'
            '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n\n'
            '이 동물을 추가 하시겠습니까?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                // 전달받은 기존 리스트에 입력한 동물을 추가
                widget.list.add(animal);

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

  String getKind(int radioValue) {
    // 라디오 번호를 문자열 종류로 변화 ex) 0 -> 양서류
    String returnValue = '';

    if (radioValue == 0) {
      returnValue = '양서류';
    } else if (radioValue == 1) {
      returnValue = '파충류';
    } else {
      returnValue = '포유류';
    }

    return returnValue;
  }
} // class
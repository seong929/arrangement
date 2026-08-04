import 'package:flutter/material.dart';
import 'package:navigator_tabber_ex_app/first.dart';
import 'package:navigator_tabber_ex_app/model/animal_list.dart';

class Second extends StatefulWidget {
  final String id;

  const Second({
    super.key,
    required this.id,
  });

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second>
    with SingleTickerProviderStateMixin {
  // 탭 관리
  late TabController controller;

  // 동물 목록
  late List<Animal> animalList;

  // 동물 추가 화면에서 사용하는 변수
  late TextEditingController nameController;
  late int _radioValue;
  late bool flyExist;
  late String _imagePath;
  late String imageName;

  @override
  void initState() {
    super.initState();

    // 탭 2개 생성
    controller = TabController(
      length: 2,
      vsync: this,
    );

    // 동물 목록 생성
    animalList = [];
    addData();

    // 동물 추가 화면 초기값
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = 'images/cow.png';
    imageName = '젖소';
  }

  @override
  void dispose() {
    controller.dispose();
    nameController.dispose();
    super.dispose();
  }

  // 기본 동물 데이터
  void addData() {
    animalList.add(
      Animal(
        imagePath: 'images/bee.png',
        animalName: '벌',
        kind: '곤충',
        flyExist: true,
      ),
    );

    animalList.add(
      Animal(
        imagePath: 'images/cat.png',
        animalName: '고양이',
        kind: '포유류',
        flyExist: false,
      ),
    );

    animalList.add(
      Animal(
        imagePath: 'images/cow.png',
        animalName: '젖소',
        kind: '포유류',
        flyExist: false,
      ),
    );

    animalList.add(
      Animal(
        imagePath: 'images/dog.png',
        animalName: '강아지',
        kind: '포유류',
        flyExist: false,
      ),
    );

    animalList.add(
      Animal(
        imagePath: 'images/fox.png',
        animalName: '여우',
        kind: '포유류',
        flyExist: false,
      ),
    );

    animalList.add(
      Animal(
        imagePath: 'images/monkey.png',
        animalName: '원숭이',
        kind: '영장류',
        flyExist: false,
      ),
    );

    animalList.add(
      Animal(
        imagePath: 'images/pig.png',
        animalName: '돼지',
        kind: '포유류',
        flyExist: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물 친구 찾기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // 탭에 따라 화면 변경
      body: TabBarView(
        controller: controller,
        children: [
          // 첫 번째 탭: 동물 목록
          First(
            list: animalList,
          ),

          // 두 번째 탭: 동물 추가 화면
          animalInsertView(),
        ],
      ),

      // 화면 아래 탭 버튼
      bottomNavigationBar: Material(
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 두 번째 탭에 표시할 동물 추가 화면
  Widget animalInsertView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              maxLength: 20,
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: '동물 이름을 입력하세요',
              ),
            ),

            // 동물 종류 선택
            RadioGroup<int>(
              groupValue: _radioValue,
              onChanged: (value) {
                _radioValue = value!;
                setState(() {});
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(value: 0),
                  Text('양서류'),
                  Radio<int>(value: 1),
                  Text('파충류'),
                  Radio<int>(value: 2),
                  Text('포유류'),
                ],
              ),
            ),

            // 날 수 있는지 선택
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),

            // 동물 이미지 선택
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  animalImage(
                    path: 'images/cow.png',
                    name: '젖소',
                  ),
                  animalImage(
                    path: 'images/pig.png',
                    name: '돼지',
                  ),
                  animalImage(
                    path: 'images/bee.png',
                    name: '벌',
                  ),
                  animalImage(
                    path: 'images/cat.png',
                    name: '고양이',
                  ),
                  animalImage(
                    path: 'images/fox.png',
                    name: '여우',
                  ),
                  animalImage(
                    path: 'images/monkey.png',
                    name: '원숭이',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              imageName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _showDialog,
              child: const Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }

  // 반복되는 동물 이미지 위젯
  Widget animalImage({
    required String path,
    required String name,
  }) {
    return GestureDetector(
      onTap: () {
        _imagePath = path;
        imageName = name;

        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: _imagePath == path
              ? Border.all(
                  color: Colors.blue,
                  width: 3,
                )
              : null,
        ),
        child: Image.asset(
          path,
          width: 80,
        ),
      ),
    );
  }

  // 동물 추가 확인 Dialog
  void _showDialog() {
    // 동물 이름 입력 검사
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('동물 이름을 입력하세요.'),
        ),
      );

      return;
    }

    Animal animal = Animal(
      imagePath: _imagePath,
      animalName: nameController.text.trim(),
      kind: getKind(_radioValue),
      flyExist: flyExist,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '이 동물은 ${animal.animalName} 입니다.\n'
            '또 이 동물의 종류는 ${animal.kind} 입니다.\n'
            '이 동물은 '
            '${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n\n'
            '이 동물을 추가하시겠습니까?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                animalList.add(animal);

                Navigator.of(context).pop();

                nameController.text = '';
                _radioValue = 0;
                flyExist = false;
                _imagePath = 'images/cow.png';
                imageName = '젖소';
                setState(() {});

                // 첫 번째 목록 탭으로 이동
                controller.animateTo(0);
              },
              child: const Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('아니요'),
            ),
          ],
        );
      },
    );
  }

  // 라디오 번호를 동물 종류로 변환
  String getKind(int radioValue) {
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
}
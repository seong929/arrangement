import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image Swiping'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),   // 어느 방향으로 swipe할지 알려주는 기능
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        onDoubleTap: () => _nextImage(),
        child: Center(    // center에 widget을 추가 simplegesturedetector
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  imageName[currentImage],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );

  } // build

  // --- Functions ---
  void _onHorizontalSwipe(SwipeDirection direction){
    if(direction == SwipeDirection.left){   // 좌우로 swipe
      currentImage++;                       // 다음 인덱스의 그림이 나오는 기능
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{ 
      currentImage -= 1;
      if(currentImage < 0){   // 0보다 작으면 마지막 이미지로 이동
        currentImage = imageName.length - 1; 
      }
    }

    setState(() {});
  }

  void _onVerticalSwipe(SwipeDirection direction){
    if(direction == SwipeDirection.up){   // 위, 아래로 swipe
      currentImage++;                       // 다음 인덱스의 그림이 나오는 기능
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{ 
      currentImage -= 1;
      if(currentImage < 0){   // 0보다 작으면 마지막 이미지로 이동
        currentImage = imageName.length - 1; 
      }
    }

    setState(() {});
  }

  void _nextImage(){
    currentImage++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
    setState(() {});
  }
} // class

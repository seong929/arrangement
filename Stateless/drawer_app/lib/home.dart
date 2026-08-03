import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              
            }, 
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(     // 클릭하면 튀어나오는 부분 appBar 밑에 써주기
        child: ListView(  // view에 관련된 것들을 담을 수 있음
          padding: EdgeInsets.zero,   // 시계 부분과 경계선을 없애주는 역할
          children: [
            UserAccountsDrawerHeader(         // 명함 카드 위젯을 나타냄
              currentAccountPicture: CircleAvatar(  // 명함 카드에 사진을 넣을 때 사용
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [        // 다른 사진들도 넣고싶을 때
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                )
              ],
              accountName: Text('Pikachu'), 
              accountEmail: Text('Pikachu@naver.com'),
              decoration: BoxDecoration(    // drawer 색상을 바꿔주는 방법
                color: Colors.red,
                borderRadius: BorderRadius.only(  // only는 모서리 부분중 한 부분만 수정
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(           // UserAccountsDrawerHeader 아래에 두기
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Home'),
              onTap: (){
                print('Home is clocked');
              },
            ),
            ElevatedButton(     // 한 칸이 꽉차는 버튼 생성(많이 쓰는 위젯 중 하나)
              onPressed: () {
                
              }, 
              child: Text('Button'),
            ),
          ],
        )
      ),
    );
  }
}
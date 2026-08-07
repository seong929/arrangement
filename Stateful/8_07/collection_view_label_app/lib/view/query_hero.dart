  // 검색 화면
  import 'package:collection_view_label_app/view/detail_hero.dart';
import 'package:collection_view_label_app/view/insert_hero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryHero extends StatefulWidget {
  const QueryHero({super.key});

  @override
  State<QueryHero> createState() => _QueryHeroState();
}

class _QueryHeroState extends State<QueryHero> {
  // Property
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = ['유비', '관우', '장비', '조조', '여포', '초선', '손견', '장양', '손책'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼국지 인물'),
        actions: [
          IconButton(
            onPressed: () => Get.to(InsertHero())!.then((value) => rebuildData(value.toString()),),  // insertHero 페이지로 들어간다. // !를 추가해줘야함(널이 들어오면 안되니까)
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: heroList.length,                               // 무조건 count 먼저 써주는 습관(한 줄에 몇갠지)
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  // 한 줄을 몇개로 나누는지 설정
            crossAxisCount: 3,                                      // 개수
            mainAxisSpacing: 10 ,                                   // 주축 간격
            crossAxisSpacing: 10,                                   // 띄어쓰기
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.amber,
              child: GestureDetector(                                         // card에 widget(GestureDetector)를 추가해서 클릭하면 넘어갈 수 있게
              onTap: () => Get.to(DetailHero(), arguments: heroList[index]),  // detailHero 페이지로 넘기면서
                child: Card(                                                  // card에 widget(Container)을 추가해주면 테두리에 색상 추가 가능
                  color: Colors.blue,
                  child: Center(child: Text(heroList[index]),),
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build

  // --- Functions ---
  void rebuildData(String value){
    if(value != ''){
      heroList.add(value);
    }
    setState(() {});
  }
} // class



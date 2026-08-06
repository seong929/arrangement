import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late DateTime date;
  late String selectDateText;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    // print(date);
    selectDateText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 일자는 : ${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} 입니다.' // 2글잔데 만약 1글자면 왼쪽부터 0으로 채우겠다
            ),
            ElevatedButton(
              onPressed: () => dispDatePicker(), 
              child: Text('Date Picker'),
            ),
            Text(selectDateText)
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  // async를 사용하면 안죽고 다른 cpu에서 계속 살아있음 (반드시 await가 있어야함)
  void dispDatePicker()async{
    int firstYear = date.year - 1;  // 1년 전부터 선택하게 만듬
    int lastYear = firstYear + 5;   // 5년치?
    final selecedDate = await showDatePicker( // future가 있으면 async랑 await를 사용
      context: context, 
      initialDate: date,
      firstDate: DateTime(firstYear), 
      lastDate: DateTime(lastYear),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: Locale('ko', 'KR')
    );
    if(selecedDate != null){
      selectDateText = '선택하신 일자는 ${selecedDate.toString().substring(0, 10)} 입니다.'; // 선택한 연도, 달, 일수까지만 나옴
      setState(() {});
    }
  }


} // class
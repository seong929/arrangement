import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<int> _dan;
  late int _selectedItem;
  late TextEditingController _guguDanController;

  @override
  void initState() {
    super.initState();
    _dan = List.generate(8, (index) => index+2,); // [2,3,4,5,6,7,8,9]
    _selectedItem = 0;
    _guguDanController = TextEditingController();
    _insertLines(_selectedItem);
  }

  void _insertLines(int dan){
    _guguDanController.text = '';

    for(int i = 1; i <= 9; i++){
      _guguDanController.text += '${_dan[dan]} X $i = ${_dan[dan] * i}\n';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${_dan[_selectedItem]} 단'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CupertinoPicker(
                itemExtent: 30, 
                onSelectedItemChanged: (value) {
                  _selectedItem = value;
                  _insertLines(_selectedItem);
                }, 
                children: List.generate(
                  8, 
                  (index) => Center(
                    child: Text(
                      '${index + 2}단',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: CupertinoTextField(
                controller: _guguDanController,
                maxLines: 10,
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
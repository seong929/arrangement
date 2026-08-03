import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});


Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Text Exercise 01'),
      centerTitle: false,
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.white,
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('유비'),
            Text('관우'),
            Text('장비'),
            Divider(

            ),
            Text('조조'),
            Text('여포'),
            Text('동탁'),
            ],
          ),
        ),
      ),
    );
  }
}
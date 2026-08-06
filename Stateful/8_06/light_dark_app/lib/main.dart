import 'package:flutter/material.dart';
import 'package:light_dark_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {  // stateless를 전구를 이용해 stateful로 변경
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _changeThemeMode(ThemeMode themeMode){  // themMode는 theme와 darkTheme
    _themeMode = themeMode;
    setState(() {});
  }

  static const seedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light ,// light 모드일 경우
        colorSchemeSeed: seedColor
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: seedColor,
      ),
      
      home: Home(onChangeTheme: _changeThemeMode),
    );
  }
}
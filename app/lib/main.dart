import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MinerdApp());
}

class MinerdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MINERD ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

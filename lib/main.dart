import 'package:flutter/material.dart';
import 'package:learn_aid/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnAid',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// colors
//  #87dcb2 green
// #c2afe1 purple

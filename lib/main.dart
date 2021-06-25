// --no-sound-null-safety 
import 'package:flutter/material.dart';
// import 'package:cryptapp/slide.dart';
import 'package:cryptapp/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

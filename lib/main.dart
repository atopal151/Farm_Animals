import 'package:flutter/material.dart';
import 'component/bottom_nav_bar.dart';
import 'home_page.dart';
import 'lists/example/example_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar()
    );
  }
}

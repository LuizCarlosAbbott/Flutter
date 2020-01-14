import 'package:flutter/material.dart';

import 'home/home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Search',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
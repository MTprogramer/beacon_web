import 'package:beacon/Web/Header.dart';
import 'package:flutter/material.dart';

import 'Web/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // background color for all screens
        primarySwatch: Colors.blue,
      ),
      home: const WebHomePage(),
    );
  }
}
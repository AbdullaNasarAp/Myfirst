import 'package:flutter/material.dart';
import 'package:myfirstproject/screens/splash.dart';

const SAVE_NAME = 'vegopedia';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VEGOPEDIA",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const Splashscreen(),
    );
  }
}

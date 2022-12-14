import 'package:flutter/material.dart';
import 'package:flutter_app_pagination/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery (grid layout)',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

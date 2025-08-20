import 'package:flutter/material.dart';
import 'package:library_app/screen/home_page.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
      home: const HomePage(),
    );
  }
}



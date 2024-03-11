import 'package:async_flutter/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

//Lấy dữ liệu từ api 
//Hiển thị lên màn hình
//Chưa lấy xong hiện icon loading
//Lấy xong hiện dữ liệu lên màn hình

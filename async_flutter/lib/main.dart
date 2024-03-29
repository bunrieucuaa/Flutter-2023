import 'package:async_flutter/home_screen.dart';
import 'package:async_flutter/setting_screen.dart';
import 'package:async_flutter/test.dart';
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
      // home: HomeScreen(),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int index = 0;
  List<Widget> widgets = const [
    HomeTest(),
    SettingScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Personal',
          ),
        ],
      ),
    );
  }
}



//Lấy dữ liệu từ api 
//Hiển thị lên màn hình
//Chưa lấy xong hiện icon loading
//Lấy xong hiện dữ liệu lên màn hình

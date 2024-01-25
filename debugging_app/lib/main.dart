import 'package:flutter/material.dart';
import 'package:debugging_app/my_object.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyObject myObject = MyObject(value: 0);
  int _value = 0;
  String? title;
  Widget _buildText() {
    return Text(
      'Giá trị: $_value',
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    myObject.increase();
                    _value = myObject.get();
                  });
                },
                child: const Text('Tính toán'),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    myObject.decrease();
                    _value = myObject.get();
                  });
                },
                child: const Text('Tính trừ'),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    myObject.set(5);
                    _value = myObject.get();
                  });
                },
                child: const Text('set value = 5'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

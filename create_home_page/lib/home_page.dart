import 'package:flutter/material.dart';
import 'package:create_home_page/my_object.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TinhToan tinhToan = TinhToan(value: 0);
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("An's App"),
          backgroundColor: const Color.fromARGB(38, 0, 70, 22),
          actions: const [
            Icon(Icons.notification_add),
            Icon(Icons.settings),
          ],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Value',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 184, 8, 8),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    tinhToan.decrease();
                    _value = tinhToan.get();
                  });
                },
                icon: const Icon(Icons.remove)),
            const SizedBox(width: 20),
            Text(
              '$_value',
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 184, 8, 8),
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
                onPressed: () {
                  setState(() {
                    tinhToan.increase();
                    _value = tinhToan.get();
                  });
                },
                icon: const Icon(Icons.add)),
          ])
        ])));
  }
}

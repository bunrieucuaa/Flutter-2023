import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int value = 0;
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.abc),
          title: const Text("My App"),
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
            const SizedBox(width: 10),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 184, 8, 8),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ])
        ])));
  }
}

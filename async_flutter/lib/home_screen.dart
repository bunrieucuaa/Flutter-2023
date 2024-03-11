import 'dart:convert';

import 'package:async_flutter/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New'),
        ),
        body: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                final data = snapshot.data ?? [];
                return Center(child: Text('User: ${data.length}'));
            }
          },
        ));
  }

  Future<List<User>> getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';

    final res = await http.get(Uri.parse(url));

    final body = json.decode(res.body) as Map<String, dynamic>;
    final List<User> result = [];

    for (final item in body['']) {
      result.add(User(
          username: item['username'] ?? '',
          email: item['email'] ?? '',
          name: item['name'] ?? '',
          phone: item['phone'] ?? '',
          website: item['website'] ?? ''));
    }
    return result;
  }
}

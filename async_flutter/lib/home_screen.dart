import 'dart:convert';

import 'package:async_flutter/article_screen.dart';
import 'package:async_flutter/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
              width: 10,
            ),
            Text(
              "Mon, 5th September 2022",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            Text(
              "Explore",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 173, 173, 173),
                    fontWeight: FontWeight.w400),
                hintText: "Search for articles...",
                fillColor: const Color.fromARGB(179, 236, 234, 234),
              ),
            ),
          ),
          SizedBox(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: ((context, index) {
                List<String> categories = [
                  'All',
                  'Politics',
                  'Sports',
                  'Health',
                  'Crypto'
                ];

                String selectedCategory = 'All';

                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            // Change the background color based on whether the category is selected or not
                            return categories[index] == selectedCategory
                                ? Colors.black
                                : Colors.white;
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            // Change the text color based on whether the category is selected or not
                            return categories[index] == selectedCategory
                                ? Colors.white
                                : Colors.grey;
                          }),
                          side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(color: Colors.grey)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(40)), // Set the height here
                        ),
                        child: Text(categories[index])));
              }),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getArticles(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());

                  case ConnectionState.done:
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16.0),
                              leading: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        snapshot.data![index].urlToImage ?? ''),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailPage(
                                        article: snapshot.data![index]),
                                  ),
                                );
                              },
                              title: Text(
                                snapshot.data![index].title,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'By ${snapshot.data![index].author ?? ''}',
                                      maxLines: 1,
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          );
                        });
                }
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: const GNav(
        tabs: [
          GButton(icon: Icons.home_outlined),
          GButton(icon: Icons.dashboard_outlined),
          GButton(icon: Icons.favorite_border),
          GButton(icon: Icons.person_outlined),
        ],
      ),
    );
  }

  Future<List<Article>> getArticles() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f8bb7a44a3a54ddc8a3025e0e72c6b67';

    final res = await http.get(Uri.parse(url));

    final body = json.decode(res.body) as Map<String, dynamic>;
    final List<Article> result = [];

    for (final article in body['articles']) {
      result.add(Article(
        title: article['title'] ?? '',
        urlToImage: article['urlToImage'] ?? '',
        author: article['author'] ?? '',
        content: article['content'] ?? '',
        description: article['description'] ?? '',
      ));
    }
    return result;
  }
}

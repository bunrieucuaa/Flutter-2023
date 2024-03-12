// import 'package:async_flutter/article_screen.dart';
// import 'package:flutter/material.dart';

// class DetailPage extends StatelessWidget {
//   const DetailPage(String title, {super.key});

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Details"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.heart_broken_rounded),
//             onPressed: () {
//               // do sht
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:async_flutter/article_screen.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // do sht
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(article.urlToImage ?? ''),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '#Politics',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'By ${article.author ?? ''}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  article.content ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

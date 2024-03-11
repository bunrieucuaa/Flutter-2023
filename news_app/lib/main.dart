import 'package:flutter/material.dart';
import 'package:news_app/network.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: fetchArticle(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text('Not Found Data'),
                  );
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());

                case ConnectionState.done:
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].title),
                        );
                      });
              }
            },
          ),
        )
        // body: Container(
        //   height: 400.0,
        //   alignment: Alignment.center,
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         decoration: InputDecoration(
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(10.0),
        //           ),
        //           prefixIcon: const Icon(Icons.search),
        //           filled: true,
        //           hintStyle: TextStyle(
        //               color: Colors.grey[800], fontWeight: FontWeight.w400),
        //           hintText: "Search for articles...",
        //           fillColor: const Color.fromARGB(179, 236, 234, 234),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

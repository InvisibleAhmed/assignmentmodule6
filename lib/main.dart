


/*Kazi Shahed Ahmed
* Flutter Batch - 4
* Module-6: Assignment
* */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Photo Gallery"),
          centerTitle: true,
        ),
        body: MyHomePage(),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            child: Icon(Icons.upload),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Photos Uploaded Successfully!"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to the Photo Gallery",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search for photos...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Image $index clicked"),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      //'https://example.com/image$index.jpg', // Replace with your image URLs
                      'https://cdn.pixabay.com/photo/2014/07/31/23/10/biker-407123_1280.jpg',
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Image Caption $index"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Sample Photo 1"),
          subtitle: Text("Subtitle 1"),
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Sample Photo 2"),
          subtitle: Text("Subtitle 2"),
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Sample Photo 3"),
          subtitle: Text("Subtitle 3"),
        ),
      ],
    );
  }
}

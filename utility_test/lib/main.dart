import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    callUtility();
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
            child: Container(
          child: const Text("data"),
        )),
      ),
    );
  }

  callUtility() {
    Map<String, dynamic> data = {
      "id": 11,
      "title": "perfume Oil",
      "description": "Mega Discount, Impression of A...",
      "price": 13,
      "discountPercentage": 8.4,
      "rating": 4.26,
      "stock": 65,
      "brand": "Impression of Acqua Di Gio",
      "category": "fragrances",
      "thumbnail": "https://i.dummyjson.com/data/products/11/thumbnail.jpg",
      "images": [
        "https://i.dummyjson.com/data/products/11/1.jpg",
        "https://i.dummyjson.com/data/products/11/2.jpg",
        "https://i.dummyjson.com/data/products/11/3.jpg",
        "https://i.dummyjson.com/data/products/11/thumbnail.jpg",
      ]
    };
    print("Json Data ${data.toString()}");
    final jsonStr = jsonEncode(data);
    print("Json String $jsonStr");
    final stringToB64 = utf8.fuse(base64);
    final stringToB644 = utf8.fuse(base64);
    final encoded = stringToB64.encode(jsonStr);
    print("encoded String $encoded");
    final decoded = stringToB644.decode(encoded);
    print("decoded String $decoded");
    final jsonData = jsonDecode(decoded);
    print("json Data $jsonData");
  }
}

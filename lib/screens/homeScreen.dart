import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/searchBar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1c1c1f),
          title: const Text(
            "OP.GG",
            style: TextStyle(
              color: Color(0xFF5383e8),
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Column(
          children: [
            const SearchBar(),
            Container(
              height: 40,
              color: Colors.red,
              child: Text("Hello"),
            ),
            Container(
              height: 40,
              color: Colors.blue,
              child: Text("World!"),
            ),
          ],
        ),
      ),
    );
  }
}

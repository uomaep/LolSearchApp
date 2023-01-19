import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  final String inputText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c1c1f),
        elevation: 0,
        title: Text(
          inputText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border_rounded,
              size: 27,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF1c1c1f),
    );
  }
}

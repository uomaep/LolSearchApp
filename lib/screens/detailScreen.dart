import 'package:app/services/apiServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/summonerModel.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  final String inputText;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Summoner> summoner;

  @override
  void initState() {
    super.initState();
    summoner = ApiServices.getSummoner(widget.inputText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c1c1f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c1c1f),
        elevation: 0,
        title: Text(
          widget.inputText,
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
      body: Column(
        children: [],
      ),
    );
  }
}

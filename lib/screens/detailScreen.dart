import 'package:app/models/historiesModel.dart';
import 'package:app/models/historyModel.dart';
import 'package:app/services/apiServices.dart';
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
  late Future<Histories> histories;

  @override
  void initState() {
    super.initState();
    summoner = ApiServices.getSummoner(widget.inputText);
    histories = ApiServices.getLatestHistoriesById(widget.inputText);
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
        children: [
          FutureBuilder(
            future: summoner,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var user = snapshot.data!;
                return Row(
                  children: [
                    Text(
                      user.id,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user.tier,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${user.wins}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${user.losses}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          FutureBuilder(
            future: histories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var latestHistories = snapshot.data!.histories;
                for (Map<String, dynamic> history in latestHistories) {
                  History tmp = History.fromJson(history);
                  print(tmp);
                }
                return Row(
                  children: const [],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

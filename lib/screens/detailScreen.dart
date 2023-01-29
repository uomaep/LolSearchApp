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
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF171719),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              FutureBuilder(
                future: summoner,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          height: 150,
                          color: const Color(0xFF1c1c1f),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 20,
                          ),
                          width: double.infinity,
                          color: const Color(0xFF1c1c1f),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.inputText,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    "래더 랭킹-",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color(0xFF1c1c1f),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5383e8),
                                  minimumSize: const Size(200, 50),
                                ),
                                child: const Text("전적 갱신"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  minimumSize: const Size(200, 50),
                                ),
                                child: const Text("인게임"),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: histories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var latestHistories = snapshot.data!.histories;
                    List<History> histories = [];
                    for (Map<String, dynamic> history in latestHistories) {
                      History tmp = History.fromJson(history);
                      histories.add(tmp);
                    }
                    return Column(
                      children: [
                        for (var h in histories)
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 100,
                            color: const Color.fromARGB(255, 33, 33, 36),
                            child: Row(children: [
                              Container(
                                color: h.result ? Colors.blue : Colors.red,
                                width: 50,
                                child: Center(
                                  child: Text(
                                    h.result ? "승" : "패",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(),
                            ]),
                          ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

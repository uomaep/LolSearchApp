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

  String checkSpell(String position) {
    switch (position) {
      case "탑":
        return "Teleport.webp";
      case "정글":
        return "Smite.webp";
      case "미드":
        return "Fire.webp";
      case "원딜":
        return "Heal.webp";
      case "서폿":
        return "Exhaust.webp";
      default:
        return "Fire.webp";
    }
  }

  String checkTier(String tier) {
    switch (tier) {
      case "챌린저":
        return "challenger.webp";
      case "마스터":
        return "master.webp";
      case "다이아몬드":
        return "diamond.webp";
      case "플레티넘":
        return "platinum.webp";
      case "골드":
        return "gold.webp";
      case "실버":
        return "sliver.webp";
      default:
        return "unrank.webp";
    }
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
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Image.asset(
                                    "assets/images/tier/${checkTier(snapshot.data!.tier)}"),
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
                            height: 110,
                            color: const Color.fromARGB(255, 33, 33, 36),
                            child: Row(children: [
                              Container(
                                color: h.result ? Colors.blue : Colors.red,
                                width: 40,
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
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 53,
                                          height: 53,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Image.asset(
                                            "assets/images/champions/${h.champion}.webp",
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: 25,
                                          height: 53,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 25,
                                                height: 25,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/spells/${checkSpell(h.position)}",
                                                ),
                                              ),
                                              const SizedBox(height: 3),
                                              Container(
                                                width: 25,
                                                height: 25,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/spells/Flash.webp",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Row(
                                          children: [
                                            Text(
                                              "${h.kda[0]} /",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              " ${h.kda[1]} ",
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "/ ${h.kda[2]}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        for (var item in h.items)
                                          item == ""
                                              ? Container(
                                                  width: 30,
                                                  height: 30,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 3),
                                                  child: Container(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 53, 47, 47)),
                                                )
                                              : Container(
                                                  width: 30,
                                                  height: 30,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 3),
                                                  child: Image.asset(
                                                      "assets/images/items/$item.webp"),
                                                ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          margin:
                                              const EdgeInsets.only(right: 3),
                                          child: Image.asset(
                                              "assets/images/items/${h.totem}.webp"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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

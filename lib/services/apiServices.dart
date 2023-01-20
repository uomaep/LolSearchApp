import 'dart:convert';

import '../models/historiesModel.dart';
import '../models/summonerModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = "http://localhost:3001";

  static Future<Summoner> getSummoner(String nickName) async {
    final url = Uri.parse("$baseUrl/summoners/$nickName");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var summoner = jsonDecode(response.body);
      return Summoner.fromJson(summoner);
    }

    throw Error();
  }

  static Future<Histories> getLatestHistoriesById(String id) async {
    final url = Uri.parse("$baseUrl/histories/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> histories = jsonDecode(response.body);
      return Histories.fromJson(histories);
    }
    throw Error();
  }
}

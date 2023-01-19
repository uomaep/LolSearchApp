import 'dart:convert';

import '../models/summonerModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = "http://localhost:3005";

  static Future<Summoner> getSummoner(String nickName) async {
    final url = Uri.parse("$baseUrl/summoners?nickName=$nickName");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> summoner = jsonDecode(response.body);
      return Summoner.fromJson(summoner);
    }

    throw Error();
  }

  static String tmp() {
    return "Hi";
  }
}

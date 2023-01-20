class Histories {
  final String id;
  final List<dynamic> histories;

  Histories.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        histories = json['matchHistory'];
}

class Histories {
  final String id;
  final List<Map<String, dynamic>> histories;

  Histories.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        histories = json['matchHistory'];
}

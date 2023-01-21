class History {
  final String champion, position, totem;
  final bool result;
  final List<dynamic> kda;
  final List<dynamic> items;

  History.fromJson(Map<String, dynamic> json)
      : champion = json['champion'],
        position = json['position'],
        totem = json['totem'],
        result = json['result'],
        kda = json['kda'],
        items = json['items'];

  @override
  String toString() {
    return "$champion->${result ? "승" : "패"}";
  }
}

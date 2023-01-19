class Summoner {
  final String id, tier;
  final int wins, losses, rank;

  Summoner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tier = json['tier'],
        wins = json['wins'],
        losses = json['losses'],
        rank = json['rank'];
}

class Summoner {
  final String id, nickName, tier;
  final int wins, losses, rank;

  Summoner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nickName = json['nickName'],
        tier = json['tier'],
        wins = json['wins'],
        losses = json['losses'],
        rank = json['rank'];
}

class PlayerStatistics {
  Player player;
  List<PlayerStc> statistics;

  PlayerStatistics(this.player, this.statistics);

  factory PlayerStatistics.fromJson(Map<String, dynamic> json) {
    return PlayerStatistics(
      Player.fromJson(json['player']),
      (json['statistics'] as List)
          .map((stat) => PlayerStc.fromJson(stat))
          .toList(),
    );
  }
}

class Player {
  int id;
  String name;
  String photo;

  Player(
    this.id,
    this.name,
    this.photo,
  );

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      json['id'],
      json['name'],
      json['photo'],
    );
  }
}

class PlayerStc {
  Team? team;
  Cards cards;
  Goals goals;

  PlayerStc(this.team, this.cards, this.goals);

  factory PlayerStc.fromJson(Map<String, dynamic> json) {
    return PlayerStc(
      json['team'] != null ? Team.fromJson(json['team']) : null,
      Cards.fromJson(json['cards']),
      Goals.fromJson(json['goals']),
    );
  }
}

class Team {
  int id;
  String name;
  String logo;

  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }
}

class Cards {
  int yellow;
  int red;

  Cards(this.yellow, this.red);

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      json['yellow'] ?? 0,
      json['red'] ?? 0,
    );
  }
}

class Goals {
  int total;
  int assists;

  Goals(this.total, this.assists);

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      json['total'] ?? 0,
      json['assists'] ?? 0,
    );
  }
}

class BasketballGamesModel {
  int id;
  String date;
  String time;
  int timestamp;
  Status status;
  League league;
  Country country;
  Scores scores;
  Team home;
  Team away;

  BasketballGamesModel(
    this.id,
    this.date,
    this.time,
    this.timestamp,
    this.status,
    this.league,
    this.country,
    this.scores,
    this.home,
    this.away,
  );

  factory BasketballGamesModel.fromJson(Map<String, dynamic> json) {
    return BasketballGamesModel(
      json['id'],
      json['date'],
      json['time'],
      json['timestamp'],
      Status.fromJson(json['status']),
      League.fromJson(json['league']),
      Country.fromJson(json['country']),
      Scores.fromJson(json['scores']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
    );
  }
}

class Status {
  String long;
  String short;
  dynamic timer;

  Status(this.long, this.short, this.timer);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      json['long'],
      json['short'],
      json['timer'],
    );
  }
}

class League {
  int id;
  String name;
  String type;
  String logo;

  League(this.id, this.name, this.type, this.logo);

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      json['id'],
      json['name'],
      json['type'],
      json['logo'],
    );
  }
}

class Country {
  int id;
  String name;
  String code;

  Country(this.id, this.name, this.code);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(json['id'], json['name'], json['code'] ?? "");
  }
}

class Team {
  int id;
  String name;
  String logoUrl;
  bool? winner;
  Team(this.id, this.name, this.logoUrl, this.winner);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo'], json['winner']);
  }
}

class Scores {
  Score home;
  Score away;

  Scores(this.home, this.away);

  factory Scores.fromJson(Map<String, dynamic> json) {
    return Scores(
      Score.fromJson(json['home']),
      Score.fromJson(json['away']),
    );
  }
}

class Score {
  int total;

  Score(
    this.total,
  );

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      json['total'] ?? 0,
    );
  }
}

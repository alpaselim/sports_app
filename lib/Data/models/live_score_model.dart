class LiveScore {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  League league;
  Score halfTime;
  Score fullTime;
  LiveScore(this.fixture, this.home, this.away, this.goal, this.league,
      this.halfTime, this.fullTime);

  factory LiveScore.fromJson(Map<String, dynamic> json) {
    return LiveScore(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.fromJson(json['goals']),
      League.fromJson(json['league']),
      Score.fromJson(json['score']['halftime']),
      Score.fromJson(json['score']['fulltime']),
    );
  }
}

//here we will store the fixture
class Fixture {
  int id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date'], Status.fromJson(json['status']));
  }
}

class League {
  int id;
  String name;
  String country;
  String logoUrl;
  String flagUrl;
  String round;

  League(
      this.id, this.name, this.country, this.logoUrl, this.flagUrl, this.round);

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      json['id'],
      json['name'] ?? "",
      json['country'] ?? "",
      json['logo'] ?? "",
      json['flag'] ?? "",
      json['round'] ?? "",
    );
  }
}

class Status {
  int? elapsedTime;
  String long;
  String short;
  Status(this.elapsedTime, this.long, this.short);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'], json['long'], json["short"]);
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

class Score {
  int home;
  int away;

  Score(this.home, this.away);

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(json['home'] ?? 0, json['away'] ?? 0);
  }
}

class Goal {
  int? home;
  int? away;
  Goal(this.home, this.away);

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(json['home'], json['away']);
  }
}

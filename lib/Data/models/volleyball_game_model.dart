class VolleyballGamesModel {
  int id;
  String date;
  String time;
  int timestamp;
  MatchStatus status;
  Country country;
  League league;
  MatchTeams teams;
  MatchScores scores;
  MatchPeriods periods;

  VolleyballGamesModel(
    this.id,
    this.date,
    this.time,
    this.timestamp,
    this.status,
    this.country,
    this.league,
    this.teams,
    this.scores,
    this.periods,
  );

  factory VolleyballGamesModel.fromJson(Map<String, dynamic> json) {
    return VolleyballGamesModel(
      json['id'],
      json['date'],
      json['time'],
      json['timestamp'],
      MatchStatus.fromJson(json['status']),
      Country.fromJson(json['country']),
      League.fromJson(json['league']),
      MatchTeams.fromJson(json['teams']),
      MatchScores.fromJson(json['scores']),
      MatchPeriods.fromJson(json['periods']),
    );
  }
}

class MatchStatus {
  String long;
  String short;

  MatchStatus(
    this.long,
    this.short,
  );

  factory MatchStatus.fromJson(Map<String, dynamic> json) {
    return MatchStatus(
      json['long'],
      json['short'],
    );
  }
}

class Country {
  int id;
  String name;
  String code;

  Country(
    this.id,
    this.name,
    this.code,
  );

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json['id'],
      json['name'],
      json['code'] ?? "",
    );
  }
}

class League {
  int id;
  String name;
  String type;
  String logo;
  int season;

  League(
    this.id,
    this.name,
    this.type,
    this.logo,
    this.season,
  );

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      json['id'],
      json['name'],
      json['type'],
      json['logo'],
      json['season'],
    );
  }
}

class MatchTeams {
  MatchTeam home;
  MatchTeam away;

  MatchTeams(
    this.home,
    this.away,
  );

  factory MatchTeams.fromJson(Map<String, dynamic> json) {
    return MatchTeams(
      MatchTeam.fromJson(json['home']),
      MatchTeam.fromJson(json['away']),
    );
  }
}

class MatchTeam {
  int id;
  String name;
  String logo;

  MatchTeam(
    this.id,
    this.name,
    this.logo,
  );

  factory MatchTeam.fromJson(Map<String, dynamic> json) {
    return MatchTeam(
      json['id'],
      json['name'],
      json['logo'],
    );
  }
}

class MatchScores {
  int home;
  int away;

  MatchScores(
    this.home,
    this.away,
  );

  factory MatchScores.fromJson(Map<String, dynamic> json) {
    return MatchScores(
      json['home'] ?? 0,
      json['away'] ?? 0,
    );
  }
}

class MatchPeriods {
  MatchPeriod first;
  MatchPeriod second;
  MatchPeriod third;
  MatchPeriod fourth;
  MatchPeriod fifth;

  MatchPeriods(
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
  );

  factory MatchPeriods.fromJson(Map<String, dynamic> json) {
    return MatchPeriods(
      MatchPeriod.fromJson(json['first']),
      MatchPeriod.fromJson(json['second']),
      MatchPeriod.fromJson(json['third']),
      MatchPeriod.fromJson(json['fourth']),
      MatchPeriod.fromJson(json['fifth']),
    );
  }
}

class MatchPeriod {
  int? home;
  int? away;

  MatchPeriod(
    this.home,
    this.away,
  );

  factory MatchPeriod.fromJson(Map<String, dynamic> json) {
    return MatchPeriod(
      json['home'],
      json['away'],
    );
  }
}

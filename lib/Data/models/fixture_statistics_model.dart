class FixtureResult {
  Team team;
  List<Statistic> statistics;

  FixtureResult({
    required this.team,
    required this.statistics,
  });

  factory FixtureResult.fromJson(Map<String, dynamic> json) {
    return FixtureResult(
      team: Team.fromJson(json['team']),
      statistics: List<Statistic>.from(
        json['statistics'].map((statistic) => Statistic.fromJson(statistic)),
      ),
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

class Statistic {
  String type;
  dynamic value;

  Statistic({
    required this.type,
    required this.value,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      type: json['type'],
      value: json['value'] ?? (json['value'] is String ? '0' : 0),
    );
  }
}

class PuanTablosu {
  League league;

  PuanTablosu(this.league);

  factory PuanTablosu.fromJson(Map<String, dynamic> json) {
    return PuanTablosu(League.fromJson(json['league']));
  }
}

//here we will store the fixture
class League {
  int id;
  String name;
  String country;
  String logo;
  String? flag;
  int season;
  List<List<TeamStanding>> standings;

  League(this.id, this.name, this.country, this.logo, this.flag, this.season,
      this.standings);

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
        json['id'],
        json['name'],
        json['country'],
        json['logo'],
        json['flag'],
        json['season'],
        List<List<TeamStanding>>.from(json['standings'].map((x) =>
            List<TeamStanding>.from(x.map((x) => TeamStanding.fromJson(x))))));
  }
}

class TeamStanding {
  int rank;
  Team team;
  int points;
  int goalsDiff;
  String group;
  String form;
  String status;

  Map<String, dynamic> all;
  Map<String, dynamic> home;
  Map<String, dynamic> away;
  String update;

  TeamStanding({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    required this.all,
    required this.home,
    required this.away,
    required this.update,
  });

  factory TeamStanding.fromJson(Map<String, dynamic> json) {
    return TeamStanding(
      rank: json['rank'],
      team: Team.fromJson(json['team']),
      points: json['points'],
      goalsDiff: json['goalsDiff'],
      group: json['group'],
      form: json['form'],
      status: json['status'],
      all: Map<String, dynamic>.from(json['all']),
      home: Map<String, dynamic>.from(json['home']),
      away: Map<String, dynamic>.from(json['away']),
      update: json['update'],
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

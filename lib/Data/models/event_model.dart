class Event {
  Time time;
  Team team;
  Player player;
  Assist assist;
  String type;
  String detail;
  dynamic comments;

  Event({
    required this.time,
    required this.team,
    required this.player,
    required this.assist,
    required this.type,
    required this.detail,
    required this.comments,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      time: Time.fromJson(json['time']),
      team: Team.fromJson(json['team']),
      player: Player.fromJson(json['player']),
      assist: Assist.fromJson(json['assist']),
      type: json['type'],
      detail: json['detail'],
      comments: json['comments'],
    );
  }
}

class Time {
  int elapsed;
  int? extra;

  Time(this.elapsed, this.extra);

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(json['elapsed'], json['extra']);
  }
}

class Team {
  int id;
  String name;
  String logo;

  Team(this.id, this.name, this.logo);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo']);
  }
}

class Player {
  int id;
  String name;

  Player(this.id, this.name);

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(json['id'], json['name']);
  }
}

class Assist {
  int? id;
  String? name;

  Assist(this.id, this.name);

  factory Assist.fromJson(Map<String, dynamic> json) {
    return Assist(json['id'], json['name']);
  }
}

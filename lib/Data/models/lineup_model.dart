class LineupData {
  Team team;
  String formation;
  List<StartXI> startXI;
  List<Substitute> substitutes;
  Direktor coach;

  LineupData({
    required this.team,
    required this.formation,
    required this.startXI,
    required this.substitutes,
    required this.coach,
  });

  factory LineupData.fromJson(Map<String, dynamic> json) {
    return LineupData(
      team: Team.fromJson(json['team']),
      formation: json['formation'],
      startXI:
          List<StartXI>.from(json['startXI'].map((x) => StartXI.fromJson(x))),
      substitutes: List<Substitute>.from(
          json['substitutes'].map((x) => Substitute.fromJson(x))),
      coach: Direktor.fromJson(json['coach']),
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

/*class Colors {
  PlayerColors player;
  GoalkeeperColors goalkeeper;

  Colors({
    required this.player,
    required this.goalkeeper,
  });

  factory Colors.fromJson(Map<String, dynamic> json) {
    return Colors(
      player: PlayerColors.fromJson(json['player']),
      goalkeeper: GoalkeeperColors.fromJson(json['goalkeeper']),
    );
  }
} */

/*class PlayerColors {
  String primary;
  String number;
  String border;

  PlayerColors({
    required this.primary,
    required this.number,
    required this.border,
  });

  factory PlayerColors.fromJson(Map<String, dynamic> json) {
    return PlayerColors(
      primary: json['primary'],
      number: json['number'],
      border: json['border'],
    );
  }
} */

/*class GoalkeeperColors {
  String primary;
  String number;
  String border;

  GoalkeeperColors({
    required this.primary,
    required this.number,
    required this.border,
  });

  factory GoalkeeperColors.fromJson(Map<String, dynamic> json) {
    return GoalkeeperColors(
      primary: json['primary'],
      number: json['number'],
      border: json['border'],
    );
  }
}  */

class StartXI {
  Player player;

  StartXI({required this.player});

  factory StartXI.fromJson(Map<String, dynamic> json) {
    return StartXI(
      player: Player.fromJson(json['player']),
    );
  }
}

class Substitute {
  Player player;

  Substitute({required this.player});

  factory Substitute.fromJson(Map<String, dynamic> json) {
    return Substitute(
      player: Player.fromJson(json['player']),
    );
  }
}

class Player {
  int id;
  String name;
  int number;
  String pos;

  Player({
    required this.id,
    required this.name,
    required this.number,
    required this.pos,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      pos: json['pos'],
    );
  }
}

class Direktor {
  int id;
  String name;
  String photo;

  Direktor({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory Direktor.fromJson(Map<String, dynamic> json) {
    return Direktor(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}

class Takim {
  final int id;
  final String name;
  final String logo;

  Takim(
    this.id,
    this.name,
    this.logo,
  );

  factory Takim.fromJson(Map<String, dynamic> json) {
    return Takim(
      json['id'],
      json['name'],
      json['logo'],
    );
  }
}

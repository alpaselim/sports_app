class Coach {
  final int id;
  final String name;
  final int age;
  final String photo;

  Coach(
    this.id,
    this.name,
    this.age,
    this.photo,
  );

  // JSON'dan Dart nesnesine dönüştürme
  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(json['id'], json['name'], json['age'], json['photo']);
  }
}

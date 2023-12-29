class SearchTeam {
  final Team? team;
  final Venue? venue;

  SearchTeam(this.team, this.venue);

  factory SearchTeam.fromJson(Map<String, dynamic> json) {
    return SearchTeam(
      json['team'] != null ? Team.fromJson(json['team']) : null,
      json['venue'] != null ? Venue.fromJson(json['venue']) : null,
    );
  }
}

class Team {
  final int? id;
  final String? name;
  final String? code;
  final String? country;
  final int? founded;
  final bool? national;
  final String? logo;

  Team({
    this.id,
    this.name,
    this.code,
    this.country,
    this.founded,
    this.national,
    this.logo,
  });

  factory Team.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Team(); // Return an instance with all properties set to null.
    }

    return Team(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      country: json['country'],
      founded: json['founded'],
      national: json['national'],
      logo: json['logo'],
    );
  }
}

class Venue {
  final int? id;
  final String? name;
  final String? address;
  final String? city;
  final int? capacity;
  final String? surface;
  final String? image;

  Venue({
    this.id,
    this.name,
    this.address,
    this.city,
    this.capacity,
    this.surface,
    this.image,
  });

  factory Venue.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Venue(); // Return an instance with all properties set to null.
    }

    return Venue(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      capacity: json['capacity'],
      surface: json['surface'],
      image: json['image'],
    );
  }
}

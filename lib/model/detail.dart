
class DetailsModel {
  String? name;
  String? classification;
  String? designation;
  String? average_height;
  String? skin_colors;
  String? hair_colors;
  String? eye_colors;
  String? average_lifespan;
  String? homeworld;
  String? language;
  String? created;
  String? edited;
  String? url;
  List<String>? people;
  List<String>? films;

  DetailsModel({ this.name, this.classification, this.designation,
    this.average_height, this.skin_colors, this.hair_colors,
    this.eye_colors, this.average_lifespan, this.homeworld,
    this.language, this.created, this.edited,
    this.url, this.people, this.films});

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      homeworld: json['homeworld'],
      edited: json['edited'],
      skin_colors: json['skin_colors'],
      created: json['created'],
      average_height: json['average_height'],
      average_lifespan: json['average_lifespan'],
      hair_colors: json['hair_colors'],
      url: json['url'],
      language: json['language'],
      eye_colors: json['eye_colors'],
      films: List<String>.from(json["films"].map((x) => x)),
      people: List<String>.from(json["people"].map((x) => x)),
    );
  }
}
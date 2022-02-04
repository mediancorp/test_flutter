
class HomeModel {
  String? name;
  HomeModel({ this.name,});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      name: json['name'],
    );
  }
}
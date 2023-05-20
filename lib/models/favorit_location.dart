import 'package:uuid/uuid.dart';

class FavoritLocation {
  late String name;
  String id = "";
  double latitude;
  double longitude;

  FavoritLocation({
    id = "",
    required this.name,
    required this.latitude,
    required this.longitude,
  }) {
    if (this.id == '') {
      this.id = const Uuid().v1();
    }
  }

  factory FavoritLocation.fromJson(Map<String, dynamic> json) =>
      FavoritLocation(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}

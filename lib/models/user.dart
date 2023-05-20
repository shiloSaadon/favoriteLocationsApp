import 'package:uuid/uuid.dart';

import 'favorit_location.dart';

class User {
  late String name;
  String id = "";
  Map<String, FavoritLocation> favoritLocations = {};

  User({
    id = "",
    required this.favoritLocations,
    required this.name,
  }) {
    if (this.id == '') {
      this.id = const Uuid().v1();
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    favoritLocations = _favoritLocationsFromJson(json["favoritLocations"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "favoritLocations": favoritLocations,
      };

  /// Exporting the favorit location of the user from the json
  Map<String, FavoritLocation> _favoritLocationsFromJson(
      Map<dynamic, dynamic> json) {
    Map<String, FavoritLocation> favorites = {};
    // pass over the map
    for (var element in (json as List<Map<dynamic, dynamic>>)) {
      FavoritLocation favoritLocation =
          FavoritLocation.fromJson(element as Map<String, dynamic>);
      favorites[favoritLocation.id] = favoritLocation;
    }
    return favorites;
  }

  /// Get favoritLocation and add to the user favorites
  void addFavorit(FavoritLocation favoritLocation) {
    favoritLocations[favoritLocation.id] = favoritLocation;
  }

  /// Get favoritLocationId and remove the favorit from the user favorites
  void removeFavorit(String id) {
    favoritLocations.remove(id);
  }
}

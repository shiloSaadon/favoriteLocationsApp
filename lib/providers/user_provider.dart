import 'package:flutter/material.dart';
import 'package:nav_app_4_host/models/favorit_location.dart';
import 'package:nav_app_4_host/models/user.dart';

class UserProvider extends ChangeNotifier {
  User user = User(name: "Jhon Doh", favoritLocations: {});

  static final UserProvider _singleton = UserProvider._internal();

  UserProvider._internal();

  factory UserProvider() {
    UserProvider object = _singleton;
    return object;
  }

  /// Get: `name`, `longitude`, `latitude` create favorit location
  /// and add it to the user location
  void addFavoritLaction(
      {required String name,
      required double longitude,
      required double latitude}) {
    user.addFavorit(
        FavoritLocation(name: name, latitude: latitude, longitude: longitude));
    updateState();
  }

  /// Get: `id` remove thr favorit from the user locations
  void removeFavorite(String id) {
    user.removeFavorit(id);
    updateState();
  }

  /// empty the user data
  void initUser() {
    user = User(favoritLocations: {}, name: "Jhon Doh");
  }

  void updateState() => notifyListeners();
}

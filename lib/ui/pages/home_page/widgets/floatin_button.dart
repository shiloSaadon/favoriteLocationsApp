import 'package:flutter/material.dart';
import 'package:nav_app_4_host/providers/map_provider.dart';
import 'package:nav_app_4_host/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../sheets_opener.dart' show opedAddFavoritSheet;
import '../helpers/dialogs.dart';

class FloatinButton extends StatelessWidget {
  const FloatinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<MapProvider>().isEditMode
        ? saveLocation(context)
        : addFavorit(context);
  }

  Widget addFavorit(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => opedAddFavoritSheet(context: context),
      child: const Icon(Icons.add),
    );
  }

  Widget saveLocation(BuildContext context) {
    return Opacity(
      opacity: context.read<MapProvider>().selectedLocation == null ? .7 : 1,
      child: FloatingActionButton(
        onPressed: () => handleSave(context),
        child: const Icon(Icons.done),
      ),
    );
  }

  /// Get location name and save the favorit location if everything is valid
  Future<void> handleSave(BuildContext context) async {
    // available only if user selected location
    if (MapProvider().selectedLocation == null) {
      // stopping the edit mode - enable the user exit edit mode without adding
      MapProvider().stopEditMode();
      return;
    }
    // getting the loc name
    dynamic locName = await getLocationNameDialog(context);
    if (locName is! String) {
      return;
    }
    // adding the location the the user favorites
    UserProvider().addFavoritLaction(
        name: locName,
        longitude: MapProvider().selectedLocation!.longitude,
        latitude: MapProvider().selectedLocation!.latitude);
    // stopping the edit mode
    MapProvider().stopEditMode();
  }
}

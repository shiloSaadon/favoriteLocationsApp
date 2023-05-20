import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nav_app_4_host/providers/map_provider.dart';
import 'package:nav_app_4_host/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'loading/circle_loading.dart';

class UserMap extends StatelessWidget {
  const UserMap({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<MapProvider>();
    context.watch<UserProvider>();
    if (MapProvider().currentLocation == null) {
      MapProvider().initMap();
    }
    return context.read<MapProvider>().currentLocation == null
        ? loadongState()
        : GoogleMap(
            buildingsEnabled: true,
            onLongPress: (loc) async {
              if (!MapProvider().isEditMode) {
                return;
              }
              MapProvider().selectLocation(loc);
              return;
              // getting the name for the location
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(MapProvider().currentLocation!.latitude!,
                    MapProvider().currentLocation!.longitude!),
                zoom: 13.5),
            markers: buildMarkers(),
            onMapCreated: (controller) {
              if (!MapProvider().mapController.isCompleted) {
                MapProvider().mapController.complete(controller);
              }
            },
          );
  }

  Widget loadongState() {
    return const Center(child: CircleLoadingAnimation());
  }

  /// build the map markers
  Set<Marker> buildMarkers() {
    Set<Marker> markers = {};
    // start with the favorit locations markers
    UserProvider().user.favoritLocations.forEach((id, favoritLocation) {
      markers.add(Marker(
          infoWindow: InfoWindow(title: favoritLocation.name),
          markerId: MarkerId(favoritLocation.id),
          position:
              LatLng(favoritLocation.latitude, favoritLocation.longitude)));
    });
    // adding the current location marker
    if (MapProvider().currentLocation != null) {
      markers.add(Marker(
          infoWindow: const InfoWindow(title: "Your location"),
          markerId: MarkerId(const Uuid().v1()),
          icon: MapProvider().currentLocIcon,
          position: LatLng(MapProvider().currentLocation!.latitude!,
              MapProvider().currentLocation!.longitude!)));
    }
    // adding the selceted location
    if (MapProvider().selectedLocation != null) {
      markers.add(Marker(
          infoWindow: const InfoWindow(title: "Your Selection"),
          markerId: MarkerId(const Uuid().v1()),
          icon: MapProvider().selectedLocIcon,
          position: MapProvider().selectedLocation!));
    }
    return markers;
  }
}

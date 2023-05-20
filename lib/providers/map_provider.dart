import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../app_const/resurces.dart';
import '../utils/images.dart';

class MapProvider extends ChangeNotifier {
  bool isEditMode = false;
  LatLng? selectedLocation;
  LocationData? currentLocation;
  StreamSubscription<LocationData>? userLocationListener;
  BitmapDescriptor currentLocIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor selectedLocIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};

  static final MapProvider _singleton = MapProvider._internal();

  MapProvider._internal();

  factory MapProvider() {
    MapProvider object = _singleton;
    return object;
  }

  /// init the mao with the relevant data
  void initMap(
      {bool includeUserLocation = true,
      bool followUserlocation = false}) async {
    Location location = Location();
    if (includeUserLocation) {
      // load current location and markers images
      await Future.wait([getCucrrentLocation(location), seCustomMarkerIcon()]);
      // optional: track the user location
      if (followUserlocation) {
        startLocationListening(location);
      }
    } else {
      // without user location load only the images
      await seCustomMarkerIcon();
    }
    updateState();
  }

  /// empty all the map data
  void emptyMap() {
    isEditMode = false;
    selectedLocation = null;
    currentLocation = null;
    userLocationListener = null;
  }

  /// Get: `loc` and save it as selected location
  void selectLocation(LatLng loc) {
    selectedLocation = loc;
    updateState();
  }

  /// delete the location selection data
  void removeLocationSelection() {
    selectedLocation = null;
    updateState();
  }

  /// load the custom icons instead of the default google map icons
  Future<void> seCustomMarkerIcon() async {
    await Future.wait([
      getBytesFromAsset(defaultManImage, 90).then((icon) {
        currentLocIcon = BitmapDescriptor.fromBytes(icon);
      }),
      getBytesFromAsset(selectedLocationImage, 75).then((icon) {
        selectedLocIcon = BitmapDescriptor.fromBytes(icon);
      })
    ]);
  }

  /// Get the user current location
  Future<void> getCucrrentLocation(Location location) async {
    await location.getLocation().then((loc) {
      currentLocation = loc;
    });
  }

  /// Start listen the user location and update the camera position to it
  void startLocationListening(Location location) async {
    // reference to the map controller
    GoogleMapController googleMapController = await mapController.future;
    // starting the listening
    userLocationListener = location.onLocationChanged.listen((newLoc) async {
      // saving the new loc
      currentLocation = newLoc;
      // map camera update
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            zoom: (await googleMapController.getZoomLevel()),
            target: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!))),
      );
      updateState();
    });
  }

  // stop the location listening
  void stopLocationListening() {
    if (userLocationListener != null) {
      userLocationListener!.cancel();
    }
  }

  /// change the mat state from readOnly to able to add favorites
  void startEditMode() {
    isEditMode = true;
    updateState();
  }

  /// bring the map state back to read only
  void stopEditMode() {
    isEditMode = false;
    selectedLocation = null;
    updateState();
  }

  /// upadate all the listeners of this provider
  void updateState() => notifyListeners();
}

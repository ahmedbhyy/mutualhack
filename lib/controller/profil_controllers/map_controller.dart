import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapController extends GetxController {
  determinePosition();
}

class MapControllerImp extends MapController {
  double mylat = 0.0;

  double mylang = 0.0;

  Set<Marker> mymarkers = {
    Marker(
      markerId: const MarkerId("THE DOT"),
      position: const LatLng(36.83525122885902, 10.229170724693622),
      infoWindow: const InfoWindow(title: "THE DOT"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
  };

  Completer<GoogleMapController> googlecontroller =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(36.83525122885902, 10.229170724693622),
    zoom: 12.4746,
  );

  @override
  void onInit() {
    determinePosition();
    setInitialCameraPosition();
    super.onInit();
  }

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> setInitialCameraPosition() async {
    try {
      Position position = await determinePosition();

      kGooglePlex = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 12.4746,
      );
      mylang = position.longitude;
      mylat = position.latitude;

      update();
    } catch (e) {
      return;
    }
  }
}

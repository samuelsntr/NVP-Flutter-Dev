import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var markers = <Marker>[].obs;
  var currentLocation = const LatLng(0, 0).obs;

  void updateLocation(LatLng newLocation) {
    currentLocation.value = newLocation;
  }

  void addMarker(Marker marker) {
    markers.add(marker);
  }
}

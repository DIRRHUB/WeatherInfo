import 'package:flutter/material.dart';

import 'package:weather_info/domain/entities/location_object.dart';

class PlaceModel extends ChangeNotifier {
  List<LocationObject> places = [];
  double? latitude;
  double? longitude;

  set setPlaces(List<LocationObject> places) {
    this.places = places;
    notifyListeners();
  }
}

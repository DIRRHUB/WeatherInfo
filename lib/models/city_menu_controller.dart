import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:weather_info/domain/api_clients/dio_client.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';
import 'package:weather_info/domain/entities/location_object.dart';
import 'package:weather_info/domain/geolocation/geolocation.dart';
import 'package:weather_info/models/main_model.dart';
import 'package:weather_info/models/place_model.dart';

class CityMenuController {
  final Geolocation geolocation = Geolocation();
  final DioClient client = DioClient();
  AppForecast? appForecast;
  LocationObject locationObject = LocationObject.geolocation(null, null);
  String? locationString;
  List<LocationObject> cities = [];

  void getGeolocation(BuildContext context) async {
    await geolocation.determinePosition().then(((value) async {
      locationObject =
          LocationObject.geolocation(value.latitude, value.longitude);
      locationString = locationObject.getCoordinates;
      context.read<MainModel>().setGeolocation = locationString!;
      context.read<PlaceModel>().latitude = value.latitude;
      context.read<PlaceModel>().longitude = value.longitude;
      loadForecast(context);
      getTitleLocationString(context);
    })).catchError((e) {});
  }

  void setLocation(int index, BuildContext context) async {
    cities = context.read<PlaceModel>().places;
    locationString = cities[index].getCoordinates;
    context.read<MainModel>().setGeolocation = locationString!;
    loadForecast(context);
    getTitleLocationString(context);
  }

  void loadForecast(BuildContext context) async {
    if (locationString != null) {
      appForecast = await client.getInfo(locationString!);
      context.read<MainModel>().setInfo(appForecast);
    }
  }

  void getTitleLocationString(BuildContext context) async {
    double? latitude = context.read<PlaceModel>().latitude;
    double? longitude = context.read<PlaceModel>().longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
    Placemark placemark = placemarks[0];
    String locationString = placemarkToLocationString(placemark);
    context.read<MainModel>().setTitleLocationString = locationString;
  }

  void trySearch(String value, BuildContext context) async {
    try {
      List<Location> locations = await locationFromAddress(value);
      if (locations.isNotEmpty) {
        List<LocationObject> locationObjectList = [];
        for (Location element in locations) {
          double latitude = element.latitude;
          double longitude = element.longitude;
          List<Placemark> placemarks =
              await placemarkFromCoordinates(latitude, longitude);
          Placemark placemark = placemarks[0];
          String locationString = placemarkToLocationString(placemark);
          String fullLocationString =
              locationString + ", " + placemark.country.toString();
          LocationObject locationObject = LocationObject(
              latitude, longitude, locationString, fullLocationString);
          locationObjectList.add(locationObject);
          context.read<PlaceModel>().latitude = latitude;
          context.read<PlaceModel>().longitude = longitude;
        }
        context.read<PlaceModel>().setPlaces = locationObjectList;
      }
    } on NoResultFoundException {
      context.read<PlaceModel>().setPlaces = [];
    }
  }

  String placemarkToLocationString(Placemark placemark) {
    String locationString = placemark.locality.toString();
    if (placemark.locality.toString() == "") {
      locationString = placemark.administrativeArea.toString();
    }
    return locationString;
  }
}

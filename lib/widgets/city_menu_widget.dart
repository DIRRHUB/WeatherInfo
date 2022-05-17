import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_info/domain/api_clients/dio_client.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';
import 'package:weather_info/domain/entities/location_object.dart';
import 'package:weather_info/domain/geolocation/geolocation.dart';

import '../models/main_model.dart';

class CityMenuWidget extends StatefulWidget {
  const CityMenuWidget({Key? key}) : super(key: key);

  @override
  State<CityMenuWidget> createState() => _CityMenuWidgetState();
}

class _CityMenuWidgetState extends State<CityMenuWidget> {
  final Geolocation geolocation = Geolocation();
  final DioClient client = DioClient();
  AppForecast? appForecast;
  LocationObject locationObject = LocationObject.geolocation(null, null);

  void getLocation(BuildContext context) async {
    await geolocation.determinePosition().then(((value) async {
      locationObject =
          LocationObject.geolocation(value.latitude, value.longitude);
      String locationString = locationObject.toString();
      context.read<MainModel>().setGeolocation = locationString;
      appForecast = await client.getInfo(locationString);
      context.read<MainModel>().setInfo(appForecast);
      Navigator.of(context).pushNamed('/home');
    })).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: ElevatedButton(
              onPressed: () => getLocation(context),
              child: const Text("get location")),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';
import 'package:weather_info/resources/keys.dart';

class DioClient {
  final String _key = Keys.weatherAPI;
  final Dio _dio = Dio();
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  static const int days = 3;

  Future<AppForecast?> getInfo(String location) async {
    Response response;
    AppForecast? appForecast;
    try {
      response = await _dio.get(_baseUrl + '/forecast.json', queryParameters: {
        'key': _key,
        'q': location,
        'days': days,
        'aqi': "no",
        'alerts': "no",
      });
      appForecast = AppForecast.fromJson(response.data);
      return appForecast;
    } on DioError {
      return null;
    }
  }
}

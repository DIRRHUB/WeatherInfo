import 'package:dio/dio.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';

class DioClient {
  final String _key = "2d0727e888454269800200243221104";
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

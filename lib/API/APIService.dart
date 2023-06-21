import 'package:assesmentflutter2/Models/Weather.dart';
import 'package:dio/dio.dart';

class APIService {
  final Dio _dio = Dio();
  final String baseUrl = "http://api.weatherapi.com/v1/";
  final APIKey = "19049437f5034676aa360415232106";

  Future<Weather?> getCurrentWeather() async {
    var url =
        "${baseUrl}current.json?key=19049437f5034676aa360415232106&q=34.02139053920694,35.647088393446026";
    final Response res = await _dio.get(url);
    if (res.statusCode == 200) {
      print(res);
      dynamic jsonData = res.data;
      return Weather.fromJson(jsonData);
    }
  }

  Future<Weather?> getWeatherList() async {
    var url =
        "http://api.weatherapi.com/v1/forecast.json?key=19049437f5034676aa360415232106&q=34.02139053920694,35.647088393446026&days=14";
    final Response res = await _dio.get(url);
    if (res.statusCode == 200) {
      print(res);
      dynamic jsonData = res.data;
      return Weather.fromJson(jsonData);
    }
  }
}

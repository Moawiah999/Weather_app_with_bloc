import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_models.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '453e6649b9234d53a95113841222112';
  WeatherServices(this.dio);
  Future<WeatherModel?> getCurretWether({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMessage);
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/constants/http_constants.dart';
import 'package:weather_app/core/services/http_service.dart';
import 'package:weather_app/pages/current/domain/models/current_weather_response.dart';
import 'package:weather_app/pages/dashboard/domain/models/serach_location_response_model.dart';

abstract class CurrentWeatherRemoteDataSource{
Future<CurrentWeatherResponse> getCurrentWeather({required String location});
}
class CurrentWeatherRemoteDataSourceImpl implements CurrentWeatherRemoteDataSource{
  final HttpService _httpService = HttpService();

  @override
  Future<CurrentWeatherResponse> getCurrentWeather({required String location})async{
    try {
      final result = await _httpService.get(path:HttpConstants.currentWeather,map: {'q':location});
      return CurrentWeatherResponse.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

}

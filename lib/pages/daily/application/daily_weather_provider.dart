import 'package:flutter/material.dart';
import 'package:weather_app/core/dependency_injection_container.dart';
import 'package:weather_app/pages/daily/domain/models/daily_weather_response.dart';
import 'package:weather_app/pages/daily/domain/repository/daily_weather_repository.dart';

class DailyWeatherProvider with ChangeNotifier {
  final dailyWeatherRepository = sl<DailyWeatherRepository>();
DailyWeatherResponse? currentWeatherResponse;

  Future<DailyWeatherResponse?> getDailyWeather(
      {required String location}) async {
    try {
      currentWeatherResponse =
          await dailyWeatherRepository.getDailyWeather(location: location);
      notifyListeners();
      return currentWeatherResponse;
    } catch (e) {
      rethrow;
    }
  }
}

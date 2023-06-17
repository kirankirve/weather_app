import 'package:flutter/material.dart';
import 'package:weather_app/core/dependency_injection_container.dart';
import 'package:weather_app/pages/hourly/domain/models/hourly_weather_response.dart';
import 'package:weather_app/pages/hourly/domain/repository/current_weather_repository.dart';

class HourlyWeatherProvider with ChangeNotifier {
  final hourlyWeatherRepo = sl<HourlyWeatherRepository>();
HourlyWeatherResponse? hourlyWeatherResponse;

  Future<HourlyWeatherResponse?> getHourlyWeather(
      {required String location}) async {
    try {
      hourlyWeatherResponse =
          await hourlyWeatherRepo.getHourlyWeather(location: location);
      notifyListeners();
      return hourlyWeatherResponse;
    } catch (e) {
      rethrow;
    }
  }
}

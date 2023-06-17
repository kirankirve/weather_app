import 'package:flutter/material.dart';
import 'package:weather_app/core/dependency_injection_container.dart';
import 'package:weather_app/pages/current/domain/models/current_weather_response.dart';
import 'package:weather_app/pages/current/domain/repository/current_weather_repository.dart';

class CurrentWeatherProvider with ChangeNotifier {
  final currentWeatherRepo = sl<CurrentWeatherRepository>();
CurrentWeatherResponse? currentWeatherResponse;

  Future<CurrentWeatherResponse?> getCurrentWeather(
      {required String location}) async {
    try {
      currentWeatherResponse =
          await currentWeatherRepo.getCurrentWeather(location: location);
      notifyListeners();
      return currentWeatherResponse;
    } catch (e) {
      rethrow;
    }
  }
}

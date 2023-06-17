import 'package:get_it/get_it.dart';
import 'package:weather_app/pages/current/data/remote/current_weather_remote_data_source.dart';
import 'package:weather_app/pages/current/domain/repository/current_weather_repository.dart';
import 'package:weather_app/pages/daily/data/remote/daily_weather_remote_data_source.dart';
import 'package:weather_app/pages/daily/domain/repository/daily_weather_repository.dart';
import 'package:weather_app/pages/dashboard/data/remote/dashboard_remote_data_source.dart';
import 'package:weather_app/pages/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:weather_app/pages/hourly/data/remote/hourly_weather_remote_data_source.dart';
import 'package:weather_app/pages/hourly/domain/repository/current_weather_repository.dart';

final sl = GetIt.instance;
void initDI(){
  _initDashboard();
  _initCurrentWeather();
  _initDailyWeather();
  _initHourlyWeather();
}

void _initDashboard(){
  sl.registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(dashboardRemoteDataSource: sl()));
  sl.registerLazySingleton<DashboardRemoteDataSource>(() => DashboardRemoteDataSourceImpl());
}
void _initCurrentWeather(){
  sl.registerLazySingleton<CurrentWeatherRepository>(() => CurrentWeatherRepositoryImpl(currentWeatherRemoteDataSource: sl()));
  sl.registerLazySingleton< CurrentWeatherRemoteDataSource>(() =>  CurrentWeatherRemoteDataSourceImpl());
}
void _initDailyWeather(){
  sl.registerLazySingleton<DailyWeatherRepository>(() => DailyWeatherRepositoryImpl(dailyWeatherRemoteDataSource: sl()));
  sl.registerLazySingleton< DailyWeatherRemoteDataSource>(() =>  DailyWeatherRemoteDataSourceImpl());
}

void _initHourlyWeather(){
  sl.registerLazySingleton<HourlyWeatherRepository>(() => HourlyWeatherRepositoryImpl(hourlyWeatherRemoteDataSource: sl()));
  sl.registerLazySingleton< HourlyWeatherRemoteDataSource>(() =>  HourlyWeatherRemoteDataSourceImpl());
}
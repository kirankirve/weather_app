import 'package:weather_app/pages/hourly/data/remote/hourly_weather_remote_data_source.dart';
import 'package:weather_app/pages/hourly/domain/models/hourly_weather_response.dart';


abstract class HourlyWeatherRepository{
  Future<HourlyWeatherResponse> getHourlyWeather({required String location});

}

class HourlyWeatherRepositoryImpl extends HourlyWeatherRepository{

  HourlyWeatherRemoteDataSource hourlyWeatherRemoteDataSource;
  HourlyWeatherRepositoryImpl({required this.hourlyWeatherRemoteDataSource});
  @override
  Future<HourlyWeatherResponse> getHourlyWeather({required String location}) async{
    try {
      final result = await hourlyWeatherRemoteDataSource.getHourlyWeather(location: location);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

}
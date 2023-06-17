import 'package:weather_app/pages/current/data/remote/current_weather_remote_data_source.dart';
import 'package:weather_app/pages/current/domain/models/current_weather_response.dart';


abstract class CurrentWeatherRepository{
  Future<CurrentWeatherResponse> getCurrentWeather({required String location});

}

class CurrentWeatherRepositoryImpl extends CurrentWeatherRepository{

  CurrentWeatherRemoteDataSource currentWeatherRemoteDataSource;
  CurrentWeatherRepositoryImpl({required this.currentWeatherRemoteDataSource});
  @override
  Future<CurrentWeatherResponse> getCurrentWeather({required String location}) async{
    try {
      final result = await currentWeatherRemoteDataSource.getCurrentWeather(location: location);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

}
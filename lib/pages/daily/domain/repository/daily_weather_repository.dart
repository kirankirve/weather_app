import 'package:weather_app/pages/daily/data/remote/daily_weather_remote_data_source.dart';
import 'package:weather_app/pages/daily/domain/models/daily_weather_response.dart';


abstract class DailyWeatherRepository{
  Future<DailyWeatherResponse> getDailyWeather({required String location});

}

class DailyWeatherRepositoryImpl extends DailyWeatherRepository{

DailyWeatherRemoteDataSource dailyWeatherRemoteDataSource;
DailyWeatherRepositoryImpl({required this.dailyWeatherRemoteDataSource});
  @override
  Future<DailyWeatherResponse> getDailyWeather({required String location}) async{
    try {
      final result = dailyWeatherRemoteDataSource.getDailyWeather(location: location);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

}
import 'package:weather_app/core/constants/http_constants.dart';
import 'package:weather_app/core/services/http_service.dart';
import 'package:weather_app/pages/daily/domain/models/daily_weather_response.dart';

abstract class DailyWeatherRemoteDataSource{
Future<DailyWeatherResponse> getDailyWeather({required String location});
}
class DailyWeatherRemoteDataSourceImpl implements DailyWeatherRemoteDataSource{
  final HttpService _httpService = HttpService();

  @override
  Future<DailyWeatherResponse> getDailyWeather({required String location})async{
    try {
      final result = await _httpService.get(path:HttpConstants.currentWeather,map: {'q':location});
      return DailyWeatherResponse.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

}

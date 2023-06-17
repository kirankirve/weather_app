import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/http_constants.dart';
import 'package:weather_app/core/services/http_service.dart';
import 'package:weather_app/pages/hourly/domain/models/hourly_weather_response.dart';

abstract class HourlyWeatherRemoteDataSource{
Future<HourlyWeatherResponse> getHourlyWeather({required String location});
}
class HourlyWeatherRemoteDataSourceImpl implements HourlyWeatherRemoteDataSource{
  final HttpService _httpService = HttpService();

  @override
  Future<HourlyWeatherResponse> getHourlyWeather({required String location})async{
    try {
      final formatter =  DateFormat('yyyy-MM-dd');
      final currentDate = formatter.format(DateTime.now());


      final result = await _httpService.get(path:HttpConstants.historyWeather,map: {'q':location,'dt':currentDate});
      return HourlyWeatherResponse.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

}

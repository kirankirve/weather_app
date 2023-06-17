import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/constants/http_constants.dart';
import 'package:weather_app/core/services/http_service.dart';
import 'package:weather_app/pages/dashboard/domain/models/serach_location_response_model.dart';

abstract class DashboardRemoteDataSource{
Future<List<SearchLocationResponseModel>> getSearchLocation({required String searchedKey});
}
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource{
  final HttpService _httpService = HttpService();

  @override
  Future<List<SearchLocationResponseModel>> getSearchLocation({required String searchedKey}) async{
    try {

      final result = await _httpService.get(path:HttpConstants.searchLocation,map: {'q':searchedKey});
      return List<SearchLocationResponseModel>.from(result.map((x) {
        return SearchLocationResponseModel.fromJson(x);
      }));
    } catch (e) {
      throw e;
    }
  }

}

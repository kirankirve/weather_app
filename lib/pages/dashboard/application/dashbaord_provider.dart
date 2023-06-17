import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/dependency_injection_container.dart';
import 'package:weather_app/pages/dashboard/domain/models/serach_location_response_model.dart';
import 'package:weather_app/pages/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardProvider with ChangeNotifier{
  final dashboardRepo = sl<DashboardRepository>();

  Future<List<SearchLocationResponseModel>> getSearchLocation({required String searchedKey})async{
    try{
      final result = await dashboardRepo.getSearchLocation(searchedKey: searchedKey);
      return result;
    }catch(e)
    {
      rethrow;
    }
  }
}
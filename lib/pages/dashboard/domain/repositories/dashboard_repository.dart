import 'package:weather_app/pages/dashboard/domain/models/serach_location_response_model.dart';

import '../../data/remote/dashboard_remote_data_source.dart';

abstract class DashboardRepository{
  Future<List<SearchLocationResponseModel>> getSearchLocation({required String searchedKey});

}

class DashboardRepositoryImpl extends DashboardRepository{

  DashboardRemoteDataSource dashboardRemoteDataSource;
  DashboardRepositoryImpl({required this.dashboardRemoteDataSource});
  @override
  Future<List<SearchLocationResponseModel>> getSearchLocation({required String searchedKey})async{
    try {
      final result = await dashboardRemoteDataSource.getSearchLocation(searchedKey: searchedKey);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

}
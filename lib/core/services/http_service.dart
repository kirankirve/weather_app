/// Documentation
///
/// This class is responsible to handle All APIs related tasks
/// it has following features
/// Constructing Headers for requested API based on type of API
/// Get HTTP type method
/// PUT HTTP type method
/// POST HTTP type method
/// DELETE HTTP type method
/// IMP - EVERY API has to requested by this class only.

import 'dart:convert';

import 'package:flutter/cupertino.dart';


import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/http_constants.dart';

class HttpService {
  static final HttpService _instance = HttpService._();

  HttpService._();

  factory HttpService() {
    return _instance;
  }



  Future<T> get<T>({required String path,Map<String,dynamic>? map}) async {
    try {
      debugPrint('Base URL -- ${HttpConstants.baseUrl}$path');
      //var url = Uri.https('api.weatherapi.com', '/v1/search.json',{'key':'8c5fc0c43ed143dd8c193257231306','q':'Pune'});
      if(map != null){
        map.addEntries({'key':HttpConstants.apiKey}.entries);
      }
      var url = Uri.https('api.weatherapi.com', path,map);
      debugPrint('URL --$url');
      var response = await http.get(url, /*headers: await _defaultHeader()*/);
      debugPrint('Response --$response');
      debugPrint('Response --${jsonDecode(response.body)}');
      if (response.statusCode >= 400) {
        return Future.error("Something went wrong");
      } else if (response.statusCode == 204) {
        return Future.error('No Content');
      } else if (response.statusCode == 403) {}
      return Future.value(jsonDecode(response.body));
    } catch (e) {
      debugPrint('Error -- $e');
      return Future.error(e.toString());
    }
  }

  Future<T> post<T>(
      {required path,
      required String encodedJSON,
      bool authorizationRequired = true}) async {
    try {
      var url = Uri.https(HttpConstants.baseUrl, '$path');
      debugPrint('$url -- authorizationRequired $authorizationRequired');
      var response = await http.post(url,
          body: encodedJSON,
          /*headers: await _defaultHeader(authRequired: authorizationRequired)*/);
      if (response.statusCode >= 400) {
        return Future.error("Something went wrong");
      } else if (response.statusCode == 403) {
        return Future.error("Something went wrong with permissions");
      } else if (response.statusCode == 204) {
        return Future.error('No Content');
      }
      return Future.value(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<T> put<T>(
      {required path,
      required String encodedJSON,
      bool authorizationRequired = true}) async {
    try {
      var url = Uri.https(HttpConstants.baseUrl, '$path');
      var response = await http.put(url,
          body: encodedJSON,
          /*headers: await _defaultHeader(authRequired: authorizationRequired)*/);
      if (response.statusCode >= 400) {
        return Future.error("Something went wrong");
      }
      if (response.statusCode == 403) {
        return Future.error("Something went wrong with permissions");
      }
      if (response.statusCode == 204) {
        return Future.value(jsonDecode('{}'));
      }
      return Future.value(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<T> delete<T>({required path, String? encodedJSON}) async {
    try {
      var url = Uri.https(HttpConstants.baseUrl, '$path');
      debugPrint(url.path);
      var response = await http.delete(url,
          body: encodedJSON,/* headers: await _defaultHeader()*/);
      debugPrint('Body ${response.body} and code ${response.statusCode}');
      if (response.statusCode >= 400) {
        return Future.error("Something went wrong");
      }
      if (response.statusCode == 403) {
        return Future.error("Something went wrong with permissions");
      }
      if (response.statusCode == 204 || response.statusCode == 200) {
        return Future.error('No Content');
      }
      return Future.value(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}


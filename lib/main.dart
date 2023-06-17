import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/current/application/current_weather_provider.dart';
import 'package:weather_app/pages/daily/application/daily_weather_provider.dart';
import 'package:weather_app/pages/dashboard/application/dashbaord_provider.dart';
import 'package:weather_app/pages/hourly/application/hourly_weather_provider.dart';
import 'package:weather_app/pages/settings/application/dashboard_provider.dart';

import 'pages/dashboard/presentation/dashboard_page.dart';
import 'core/dependency_injection_container.dart' as di;

void main() {
  di.initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (create)=> SettingsProvider()),
      ChangeNotifierProvider(create: (create)=> DashboardProvider()),
      ChangeNotifierProvider(create: (create)=> CurrentWeatherProvider()),
      ChangeNotifierProvider(create: (create)=> DailyWeatherProvider()),
      ChangeNotifierProvider(create: (create)=> HourlyWeatherProvider()),
    ],builder: (context,_){
      return MaterialApp(
        title: 'Weather App',
          theme: context.watch<SettingsProvider>().themeMode != null && context.watch<SettingsProvider>().themeMode.first ?  ThemeData.light() : ThemeData.dark(), // default dark theme replaces default light theme
        home:  DashboardPage(),
      );
    },);
  }
}


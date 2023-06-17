import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/constants/string_constant.dart';
import 'package:weather_app/core/widgets/app_text.dart';
import 'package:weather_app/pages/hourly/application/hourly_weather_provider.dart';
import 'package:weather_app/pages/settings/application/dashboard_provider.dart';

class HourlyWeatherPage extends StatelessWidget {
  final String selectedLocation;

  const HourlyWeatherPage({super.key, required this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    getHourlyWeather(context, false);
    return Scaffold(
        appBar: AppBar(
            title: CustomTextWidget(
              text: 'Hourly Weather',
              textColor: Colors.white,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  getHourlyWeather(context, true);
                },
                icon: const Icon(Icons.refresh),
                iconSize: 40,
              )
            ]),
        body: context.watch<HourlyWeatherProvider>().hourlyWeatherResponse != null ? Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: getCount(context) ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Row(children: [
                    Expanded(flex: 2,
                      child: CustomTextWidget(text:
                      ' ${dateTime(context, index)}'),
                    ) ,
                    Expanded(flex: 1,
                      child: CustomTextWidget(text:
                      ' ${getTemp(context, index)}'),
                    ),
                    Expanded(flex: 1,child: Image.network(getIcon(context, index) ?? '')),
                    Expanded(flex: 1,
                      child: CustomTextWidget(text:
                      ' ${getCondition(context, index)}'),
                    ),
                  ],));
            }, separatorBuilder: (BuildContext context, int index) {
              return Container(width: double.infinity,height: 2,color: Colors.grey,);
          },
          ),
        ) : const Center(child: CircularProgressIndicator()));
  }


  getHourlyWeather(BuildContext context, bool refresh) async {
    final provider = Provider.of<HourlyWeatherProvider>(context, listen: false);
    if (provider.hourlyWeatherResponse == null || refresh) {
      final result =
          await provider.getHourlyWeather(location: selectedLocation);
      debugPrint('Result --${result?.toJson()}');
    }
  }

  String? dateTime(BuildContext context,int index){
    final formatter = DateFormat('yyyy-MM-dd hh:mm a');
    final dateTime = DateTime.parse(context.watch<HourlyWeatherProvider>().hourlyWeatherResponse?.forecast?.forecastday?.first.hour?[index].time ?? '${DateTime.now()}');
    return formatter.format(dateTime);
  }
  String? getIcon(BuildContext context,int index){
    return 'http:${context.watch<HourlyWeatherProvider>().hourlyWeatherResponse?.forecast?.forecastday?.first.hour?[index].condition?.icon}' ;
  }

  String? getTemp(BuildContext context,int index){
    return context.watch<SettingsProvider>().tempUnitSelection.first ? '${context.watch<HourlyWeatherProvider>().hourlyWeatherResponse?.forecast?.forecastday?.first.hour?[index].tempF}' : '${context.watch<HourlyWeatherProvider>().hourlyWeatherResponse?.forecast?.forecastday?.first.hour?[index].tempC}${StringConstants.tempCelsius}';
   // return '${context.watch<HourlyWeatherProvider>().hourlyWeatherResponse?.forecast?.forecastday?.first.hour?[index].tempF}${StringConstants.tempFarenh}';
  }

  String? getCondition(BuildContext context,int index){
    return '${context.watch<HourlyWeatherProvider>().hourlyWeatherResponse?.forecast?.forecastday?.first.hour?[index].condition?.text}';
  }

int? getCount(BuildContext context){
    return context
        .watch<HourlyWeatherProvider>()
        .hourlyWeatherResponse
        ?.forecast
        ?.forecastday
        ?.first
        .hour
        ?.length;
  }
}

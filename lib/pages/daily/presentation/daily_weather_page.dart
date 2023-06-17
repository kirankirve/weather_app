import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/constants/string_constant.dart';
import 'package:weather_app/core/widgets/app_text.dart';
import 'package:weather_app/pages/daily/application/daily_weather_provider.dart';

class DailyWeatherPage extends StatelessWidget {
  final String selectedLocation;
  const DailyWeatherPage({super.key,required this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    getDailyWeather(context,false);
    return Scaffold(appBar: AppBar(title: CustomTextWidget(text: 'Daily Weather',textColor: Colors.white,),actions: [IconButton(onPressed: (){
      getDailyWeather(context,true);
    }, icon: const Icon(Icons.refresh),iconSize: 40,)]),body: Center(
      child: context.watch<DailyWeatherProvider>().currentWeatherResponse != null ?Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        CustomTextWidget(textColor: Colors.black,text: selectedLocation,textSizeEnum: TextSizeEnum.veryLarge,),
        const SizedBox(height: 16,),
        CustomTextWidget(textColor: Colors.grey,text: 'Today',textSizeEnum: TextSizeEnum.large),
        const SizedBox(height: 16,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(Icons.cloud),
            const SizedBox(width: 16,),
            CustomTextWidget(textColor: Colors.blue,text: '${context.watch<DailyWeatherProvider>().currentWeatherResponse?.current?.tempF} ${StringConstants.tempFarenh}',textSizeEnum: TextSizeEnum.veryLarge),
          ],
        ),
        const SizedBox(height: 16,),
        CustomTextWidget(text: 'Humidity: ${context.watch<DailyWeatherProvider>().currentWeatherResponse?.current?.humidity} ',textSizeEnum: TextSizeEnum.veryLarge),
        const SizedBox(height: 16,),
        CustomTextWidget(text: 'Wind Speed(Kph): ${context.watch<DailyWeatherProvider>().currentWeatherResponse?.current?.windKph} ',textSizeEnum: TextSizeEnum.veryLarge),


      ],) : const CircularProgressIndicator(),
    ),);
  }

  getDailyWeather(BuildContext context,bool refresh)async{
    final provider = Provider.of<DailyWeatherProvider>(
        context, listen: false);
    if(provider.currentWeatherResponse == null || refresh) {
      final result = await provider.getDailyWeather(location: selectedLocation);
      debugPrint('Result --${result?.toJson()}');
    }
  }
}

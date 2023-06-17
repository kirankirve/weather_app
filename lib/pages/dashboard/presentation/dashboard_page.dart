import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:weather_app/core/widgets/app_button.dart';
import 'package:weather_app/core/widgets/app_text.dart';
import 'package:weather_app/pages/current/presentation/current_weather_page.dart';
import 'package:weather_app/pages/daily/presentation/daily_weather_page.dart';
import 'package:weather_app/pages/dashboard/application/dashbaord_provider.dart';
import 'package:weather_app/pages/dashboard/domain/models/serach_location_response_model.dart';
import 'package:weather_app/pages/hourly/presentation/hourly_weather_page.dart';
import 'package:weather_app/pages/settings/presentation/settings_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: CustomTextWidget(
        text: 'Dashboard',
        textColor: Colors.white,
      )),
      body: Column(
        children: [
          //GeolocatorWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldSearch(
                label: 'Search Location',
                controller: myController,
                future: () {
                  final result =
                      Provider.of<DashboardProvider>(context, listen: false)
                          .getSearchLocation(searchedKey: myController.text);
                  List<TestItem> list = List.empty(growable: true);
                  return result.then((value) {
                    for (var element in value) {
                      list.add(
                          TestItem(label: element.name ?? '', value: element));
                    }

                    return list;
                  });
                },
                getSelectedValue: (value) {

                }),
          ),
          const SizedBox(
            height: 32,
          ),
          AppButton(
            width: 200,
            title: 'Current',
            type: AppButtonType.primary,
            onClicked: () {
              debugPrint('Selected Location ---${myController.text}');
              if(myController.text != '') {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>
                    CurrentWeatherPage(selectedLocation: myController.text,)));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomTextWidget(text:'Please select a location from drop down')));
              }

            },
          ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            width: 200,
            title: 'Hourly',
            type: AppButtonType.primary,
            onClicked: () {
              if(myController.text != '') {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>
                    HourlyWeatherPage(selectedLocation: myController.text,)));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomTextWidget(text:'Please select a location from drop down')));
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            width: 200,
            title: 'Daily',
            type: AppButtonType.primary,
            onClicked: () {
              if(myController.text != '') {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>
                    DailyWeatherPage(selectedLocation: myController.text,)));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomTextWidget(text:'Please select a location from drop down')));
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            width: 200,
            title: 'Settings',
            type: AppButtonType.primary,
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const SettingsPage()));
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

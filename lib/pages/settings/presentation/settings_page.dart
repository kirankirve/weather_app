import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/widgets/app_dropdown.dart';
import 'package:weather_app/core/widgets/app_text.dart';
import 'package:weather_app/core/widgets/app_toggle_button.dart';
import 'package:weather_app/core/widgets/section_container.dart';
import 'package:weather_app/pages/settings/application/dashboard_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomTextWidget(text: 'Settings', textColor: Colors.white),
        ),
        body: Container(decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg_img.jpg"),
              fit: BoxFit.cover,
            )),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(height: MediaQuery.of(context).size.height * 0.99,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    SectionContainer(backgroundColor: Colors.grey.shade200,
                        title: 'Temp Unit',
                        child: AppToggleButtons(
                          selections:
                              context.watch<SettingsProvider>().tempUnitSelection,
                          selectedIndex: (index) =>
                              Provider.of<SettingsProvider>(context, listen: false)
                                  .updateTempUnitSelection(index: index,type: 1),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: CustomTextWidget(text: 'Fahrenheit'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: CustomTextWidget(text: 'Celsius'),
                            )
                          ],
                        )),
                    const SizedBox(height: 8,),
                    SectionContainer(backgroundColor: Colors.grey.shade200,
                        title: 'Notification',
                        child: AppToggleButtons(
                          selections:
                              context.watch<SettingsProvider>().notificationSelection,
                          selectedIndex: (index) =>
                              Provider.of<SettingsProvider>(context, listen: false)
                                  .updateTempUnitSelection(index: index,type: 2),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: CustomTextWidget(text: 'On'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: CustomTextWidget(text: 'Off'),
                            )
                          ],
                        )),
                    const SizedBox(height: 8,),
                    SectionContainer(backgroundColor: Colors.grey.shade200,
                        title: 'Theme',
                        child: AppToggleButtons(
                          selections:
                              context.watch<SettingsProvider>().themeMode,
                          selectedIndex: (index) =>
                              Provider.of<SettingsProvider>(context, listen: false)
                                  .updateTempUnitSelection(index: index,type: 3),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: CustomTextWidget(text: 'Light'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: CustomTextWidget(text: 'Dark'),
                            )
                          ],
                        )),
                    const SizedBox(height: 8,),
                    SectionContainer(backgroundColor: Colors.grey.shade200,
                        title: 'Language',
                        child: AppDropdown(list: const ['English','Hindi','Marathi'],))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

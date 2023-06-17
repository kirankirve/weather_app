import 'package:flutter/cupertino.dart';

class SettingsProvider with ChangeNotifier{
  List<bool> tempUnitSelection = [true, false];
  List<bool> notificationSelection = [true, false];
  List<bool> themeMode = [true, false];

  updateTempUnitSelection({required int index, bool? multiSelect,required int type}) {
    switch(type){
      case 1:
        if (multiSelect ?? false) {
          tempUnitSelection[index] = true;
        } else {
          for (int i = 0; i < tempUnitSelection.length; i++) {
            tempUnitSelection[i] = false;
          }
          tempUnitSelection[index] = true;
          notifyListeners();
        }
        break;
      case 2:
        if (multiSelect ?? false) {
          notificationSelection[index] = true;
        } else {
          for (int i = 0; i < notificationSelection.length; i++) {
            notificationSelection[i] = false;
          }
          notificationSelection[index] = true;
          notifyListeners();
        }
        break;
      case 3:
        if (multiSelect ?? false) {
          themeMode[index] = true;
        } else {
          for (int i = 0; i < themeMode.length; i++) {
            themeMode[i] = false;
          }
          themeMode[index] = true;
          notifyListeners();
        }
        break;
        
    }
    
  }
}

import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier {
  //intially app li8 mode
  ThemeMode themeMode = ThemeMode.light;

//chng light and dark mode fnction
  void toggleTheme() {


    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    //notify app to change theme
    notifyListeners();
  }
}

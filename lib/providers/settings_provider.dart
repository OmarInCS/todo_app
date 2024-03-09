

import 'package:flutter/material.dart';
import '../constants/app_theme.dart';

class SettingsProvider with ChangeNotifier {

  Locale currentLocale = Locale('en');
  ThemeData currentTheme = lightTheme;
  String get currentThemeName => currentTheme == lightTheme ? "Light" : "Dark";
  String get currentLocaleName => currentLocale == Locale('en') ? "English" : "Arabic";
  String get currentLocaleNameShort => currentLocale == Locale('en') ? "en" : "ar";

  void changeLocale(String lang) {
    currentLocale = lang == "Arabic" ? Locale("ar") : Locale("en");
    notifyListeners();
  }

  void changeTheme(String theme) {
    print(theme);
    currentTheme = theme == "Light" ? lightTheme : darkTheme;
    notifyListeners();
  }

}
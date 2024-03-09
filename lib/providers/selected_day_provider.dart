

import 'package:flutter/material.dart';

class SelectedDayProvider with ChangeNotifier {

  DateTime _day = DateTime.now();

  DateTime get day => _day;

  set day(DateTime value) {
    _day = value;
    notifyListeners();
  }

}
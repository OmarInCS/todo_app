
import 'package:flutter/material.dart';

const primaryLight = Color(0xFF5D9CEC);
const backgroundLight = Color(0xFFDFECDB);
const onPrimaryLight = Color(0xFFFFFFFF);
const onPrimarySelectedLight = Color(0xFF000000);

const primaryDark = Color(0xFF141922);
const backgroundDark = Color(0xFF060E1E);
const onPrimaryDark = Color(0xFFFFFFFF);
const onPrimarySelectedDark = Color(0xFF5D9CEC);

final lightTheme = ThemeData(
  primaryColor: primaryLight,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: primaryLight,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: onPrimaryLight,
    selectedItemColor: onPrimarySelectedLight,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: primaryLight,
    foregroundColor: onPrimaryLight,
    titleTextStyle: TextStyle(
      color: onPrimarySelectedLight,
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),
    elevation: 0
  ),
  scaffoldBackgroundColor: backgroundLight,
  dividerTheme: DividerThemeData(
    color: Colors.transparent,
    thickness: 0
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16)
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      )
    )
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: primaryLight,
    )
  ),
);

final darkTheme = ThemeData(
  primaryColor: primaryDark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: primaryDark,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: onPrimaryDark,
    selectedItemColor: onPrimarySelectedDark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: onPrimarySelectedDark,
    foregroundColor: primaryDark,
    titleTextStyle: TextStyle(
      color: primaryDark,
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),
    elevation: 0
  ),
  scaffoldBackgroundColor: backgroundDark,
  dividerTheme: DividerThemeData(
    color: Colors.transparent,
    thickness: 0
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    color: primaryDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: onPrimarySelectedDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      )
    )
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: primaryDark,
    )
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: primaryDark
  ),
  dialogBackgroundColor: primaryDark,
  colorScheme: ColorScheme.light().copyWith(
    surface: primaryDark,
    primary: onPrimarySelectedDark,
    onSurface: onPrimaryDark,
    onPrimary: onPrimaryDark,
  ),
);
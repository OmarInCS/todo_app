

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/settings_provider.dart';

import '../../constants/app_theme.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {

    var currentLanguage = context.select<SettingsProvider, String>((settings) => settings.currentLocaleName,);
    var currentThemeName = context.select<SettingsProvider, String>((settings) => settings.currentThemeName,);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Language"),
        SizedBox(height: 8,),
        DropdownButton(
          value: currentLanguage,
          style: currentThemeName == "Dark" ? TextStyle(
              color: onPrimarySelectedDark
          ) : null,
          dropdownColor: currentThemeName == "Dark" ? primaryDark : null,
          items: [
            DropdownMenuItem<String>(
              child: Text("Arabic"),
              value: "Arabic",
            ),
            DropdownMenuItem<String>(
              child: Text("English"),
              value: "English",
            ),
          ],
          onChanged: (value) {
            context.read<SettingsProvider>().changeLocale(value!);
          },
        ),
        SizedBox(height: 16,),
        Text("Mode"),
        SizedBox(height: 8,),
        DropdownButton(
          value: currentThemeName,
          style: currentThemeName == "Dark" ? TextStyle(
              color: onPrimarySelectedDark
          ) : null,
          dropdownColor: currentThemeName == "Dark" ? primaryDark : null,
          items: [
            DropdownMenuItem<String>(
              child: Text("Dark"),
              value: "Dark",
            ),
            DropdownMenuItem<String>(
              child: Text("Light"),
              value: "Light",
            ),
          ],
          onChanged: (value) {
            context.read<SettingsProvider>().changeTheme(value!);
          },
        ),
      ],
    );
  }
}

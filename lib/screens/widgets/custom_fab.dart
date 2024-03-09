

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_theme.dart';
import '../../providers/settings_provider.dart';
import 'add_task_modal.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    var currentThemeName = context.select<SettingsProvider, String>((settings) => settings.currentThemeName,);

    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: currentThemeName == "Light" ? backgroundLight : backgroundDark,
        borderRadius: BorderRadius.circular(50),
      ),
      child: FloatingActionButton(
        shape: CircleBorder(
            side: BorderSide(
                width: 4,
                color: Colors.white
            )
        ),
        elevation: 0,
        backgroundColor: currentThemeName == "Dark" ? onPrimarySelectedDark : null,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: currentThemeName == "Dark" ? primaryDark : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            builder: (context) {
              return AddTaskModal();
            },
          );
        },
        child: Icon(
            Icons.add
        ),
      ),
    );
  }
}
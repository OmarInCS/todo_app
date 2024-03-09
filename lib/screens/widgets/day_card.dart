
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/app_theme.dart';

import '../../providers/selected_day_provider.dart';
import '../../providers/settings_provider.dart';

class DayCard extends StatefulWidget {
  const DayCard({
    super.key,
    required this.day,
  });

  final DateTime day;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {


  @override
  Widget build(BuildContext context) {

    var isSelected = Provider.of<SelectedDayProvider>(context).day == widget.day;
    var currentThemeName = context.select<SettingsProvider, String>((settings) => settings.currentThemeName,);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          elevation: isSelected ? 8 : 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    DateFormat("MMM").format(widget.day),
                  style: currentThemeName == "Dark" ? TextStyle(
                      color: onPrimaryDark
                    ) : null,
                ),
                SizedBox(height: 8,),
                Text(
                    DateFormat("dd").format(widget.day),
                  style: currentThemeName == "Dark" ? TextStyle(
                      color: onPrimaryDark
                  ) : null,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Provider.of<SelectedDayProvider>(context, listen: false).day = widget.day;
        },
      ),
    );
  }
}

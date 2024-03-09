

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/app_theme.dart';
import '../../models/task.dart';
import '../../providers/settings_provider.dart';
import '../../providers/tasks_provider.dart';

class TaskEditCard extends StatefulWidget {
  final Task task;
  const TaskEditCard({required this.task,  Key? key}) : super(key: key);

  @override
  State<TaskEditCard> createState() => _TaskEditCardState();
}

class _TaskEditCardState extends State<TaskEditCard> {


  @override
  Widget build(BuildContext context) {

    var currentTheme = context.select<SettingsProvider, ThemeData>((settings) => settings.currentTheme,);
    var currentThemeName = context.select<SettingsProvider, String>((settings) => settings.currentThemeName,);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Edit Task",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: currentThemeName == "Dark" ? onPrimaryDark : null,
                ),
              ),
              SizedBox(height: 32,),
              TextFormField(
                initialValue: widget.task.title,
                style: currentThemeName == "Dark" ? TextStyle(
                    color: onPrimaryDark
                ) : null,
                decoration: InputDecoration(
                    hintText: "Enter your task title",
                  hintStyle: currentThemeName == "Dark" ? TextStyle(
                      color: onPrimaryDark
                  ) : null,
                ),
                onChanged: (value) {
                  widget.task.title = value;
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 32,),
              TextFormField(
                initialValue: widget.task.details,
                style: currentThemeName == "Dark" ? TextStyle(
                    color: onPrimaryDark
                ) : null,
                decoration: InputDecoration(
                  hintText: "Enter your task details",
                  hintStyle: currentThemeName == "Dark" ? TextStyle(
                      color: onPrimaryDark
                  ) : null,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                onChanged: (value) {
                  widget.task.details = value;
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 32,),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat("dd-MMM-yyyy").format(widget.task.dateTime),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: currentThemeName == "Dark" ? onPrimaryDark : null,
                    ),
                  ),
                ),
                onTap: () async {

                  var date = await showDatePicker(
                    context: context,
                    builder: (context, child) => Theme(data: currentTheme, child: child!),
                    initialDate: widget.task.dateTime,
                    firstDate: widget.task.dateTime.subtract(const Duration(days: 14)),
                    lastDate: DateTime.now().add(const Duration(days: 14)),
                  );

                  if(date != null) {
                    widget.task.dateTime = date.copyWith(
                        hour: widget.task.dateTime.hour,
                        minute: widget.task.dateTime.minute
                    );
                    setState(() {

                    });
                  }
                },
              ),
              SizedBox(height: 32,),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat("HH:mm").format(widget.task.dateTime),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: currentThemeName == "Dark" ? onPrimaryDark : null,
                    ),
                  ),
                ),
                onTap: () async {

                  var time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(widget.task.dateTime),
                  );

                  if(time != null) {
                    widget.task.dateTime = widget.task.dateTime.copyWith(
                        hour: time.hour,
                        minute: time.minute
                    );
                    setState(() {

                    });
                  }
                },
              ),
              SizedBox(height: 32,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                        fontSize: 20
                    ),
                    padding: EdgeInsets.all(16)
                ),
                child: Text(
                  "Save Changes",
                  // style: Theme.of(context).textTheme.titleLarge,
                ),
                onPressed: () {
                  context.read<TasksProvider>().updateTask(task: widget.task);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

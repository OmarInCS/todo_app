

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/selected_day_provider.dart';
import 'package:todo_app/providers/tasks_provider.dart';

import '../../constants/app_theme.dart';
import '../../providers/settings_provider.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({
    super.key,
  });

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {

  late Task newTask = Task(title: "", dateTime: Provider.of<SelectedDayProvider>(context, listen: false).day);

  @override
  Widget build(BuildContext context) {

    var currentThemeName = context.select<SettingsProvider, String>((settings) => settings.currentThemeName,);

    return Padding(
      padding: EdgeInsets.only(
        top: 16, left: 16, right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add new Task",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: currentThemeName == "Dark" ? onPrimaryDark : null,
              ),
            ),
            SizedBox(height: 32,),
            TextFormField(
              initialValue: newTask.title,
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
                newTask.title = value;
                setState(() {

                });
              },
            ),
            SizedBox(height: 32,),
            TextFormField(
              initialValue: newTask.details,
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
                newTask.details = value;
                setState(() {

                });
              },
            ),
            SizedBox(height: 32,),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat("HH:mm").format(newTask.dateTime),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: currentThemeName == "Dark" ? onPrimaryDark : null,
                  ),
                ),
              ),
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(newTask.dateTime),
                );

                if(time != null) {
                  newTask.dateTime = newTask.dateTime.copyWith(
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
                      fontSize: 20,
                  ),
                  padding: EdgeInsets.all(16)
              ),
              child: Text(
                "Add",
                // style: Theme.of(context).textTheme.titleLarge,
              ),
              onPressed: () {
                context.read<TasksProvider>().addTask(task: newTask);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

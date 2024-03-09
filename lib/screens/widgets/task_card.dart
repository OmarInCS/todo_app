
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/app_theme.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/task_edit_screen.dart';

import '../../models/task.dart';
import '../../providers/settings_provider.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({required this.task, Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {

    var currentThemeName = context.select<SettingsProvider, String>((settings) => settings.currentThemeName,);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Slidable(
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  context.read<TasksProvider>().deleteTask(taskId: widget.task.id!);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 4,
                    color: primaryLight
                  )
                )
              ),
              child: ListTile(
                title: Text(
                  widget.task.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: primaryLight
                  ),
                ),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time,
                      color: currentThemeName == "Dark" ? onPrimaryDark : null,
                    ),
                    SizedBox(width: 8,),
                    Text(
                      DateFormat("HH:mm").format(widget.task.dateTime),
                      style: currentThemeName == "Dark" ? TextStyle(
                          color: onPrimaryDark
                      ) : null,
                    )
                  ],
                ),
                trailing: widget.task.isDone
                  ? Text(
                    "Done!",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.green
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.check, size: 20, color: currentThemeName == "Dark" ? onPrimaryDark : null,),
                      onPressed: () {
                        widget.task.isDone = true;
                        context.read<TasksProvider>().updateTask(task: widget.task);
                      },
                    ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TaskEditScreen(task: widget.task),));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

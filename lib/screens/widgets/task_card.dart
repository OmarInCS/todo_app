
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_theme.dart';

import '../../models/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({required this.task, Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
                  Icon(Icons.access_time),
                  SizedBox(width: 8,),
                  Text(
                    DateFormat("HH:mm").format(widget.task.datetime)
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
                    icon: Icon(Icons.check, size: 20,),
                    onPressed: () {

                    },
                  )
            ),
          ),
        ),
      ),
    );
  }
}

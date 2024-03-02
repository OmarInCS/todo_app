
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/widgets/task_card.dart';

class ListTab extends StatefulWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ListView(
        children: [
          TaskCard(
            task: Task(
              title: "Play basket ball",
              datetime: DateTime.now()
            ),
          ),
          TaskCard(
            task: Task(
              title: "Play basket ball",
              datetime: DateTime.now()
            ),
          ),
          TaskCard(
            task: Task(
              title: "Play basket ball",
              datetime: DateTime.now()
            )..isDone = true,
          ),
          TaskCard(
            task: Task(
              title: "Play basket ball",
              datetime: DateTime.now()
            ),
          ),

        ],
      ),
    );
  }
}

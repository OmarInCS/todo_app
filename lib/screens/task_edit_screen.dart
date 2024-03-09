
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_theme.dart';
import 'package:todo_app/screens/tabs/list_tab.dart';
import 'package:todo_app/screens/tabs/settings_tab.dart';
import 'package:todo_app/screens/widgets/add_task_modal.dart';
import 'package:todo_app/screens/widgets/day_card.dart';
import 'package:todo_app/screens/widgets/days_list.dart';
import 'package:todo_app/screens/widgets/task_edit_card.dart';

import '../models/task.dart';


class TaskEditScreen extends StatefulWidget {
  final Task task;
  const TaskEditScreen({required this.task, Key? key}) : super(key: key);

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 100,
              child: AppBar(
                title: Text(AppLocalizations.of(context)!.mainScreenTitle),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TaskEditCard(task: widget.task,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



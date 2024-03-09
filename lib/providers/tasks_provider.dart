

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/providers/selected_day_provider.dart';

import '../models/task.dart';

class TasksProvider with ChangeNotifier {

  StreamSubscription<QuerySnapshot>? _tasksSubscription;
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TasksProvider([SelectedDayProvider? selectedDayProvider]) {
    _tasksSubscription = FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('dateTime')
        .snapshots()
        .listen((snapshot) {
          _tasks = [];
          for (final document in snapshot.docs) {
            var task = Task.fromJson(document.id, document.data());
            if(DateUtils.dateOnly(task.dateTime).isAtSameMomentAs(DateUtils.dateOnly(selectedDayProvider?.day ?? DateTime.now()))) {
              _tasks.add(
                  task
              );
            }
          }

          notifyListeners();
        });
  }

  void addTask({required Task task}) {
    FirebaseFirestore
        .instance
        .collection("tasks")
        .add(task.toJson());
  }

  void updateTask({required Task task}) {
    FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update(task.toJson());
  }

  void deleteTask({required String taskId}) {
    FirebaseFirestore.instance
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

}
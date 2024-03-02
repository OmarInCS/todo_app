
class Task {
  String title;
  String details;
  DateTime datetime;
  bool isDone = false;

  Task({required this.title, this.details = "", required this.datetime});

}
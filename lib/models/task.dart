
class Task {
  String? id;
  String title;
  String details;
  DateTime dateTime;
  bool isDone;

  Task({this.id, required this.title, this.details = "", required this.dateTime, this.isDone = false});


  Task.fromJson(String id, Map<String, dynamic> json) : this(
    id: id,
    title: json["title"],
    details: json["details"],
    dateTime: DateTime.parse(json["dateTime"]),
    isDone: json["isDone"],
  );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "details": details,
      "dateTime": dateTime.toIso8601String(),
      "isDone": isDone,
    };
  }
}
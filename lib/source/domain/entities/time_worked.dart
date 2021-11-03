import 'dart:convert';

class TimeWorked {
  int id;
  int task;
  int? activity;
  DateTime date;
  Duration duration;
  String? description;

  TimeWorked({
    required this.id,
    required this.task,
    this.activity,
    required this.date,
    required this.duration,
    this.description,
  });

  factory TimeWorked.fromMap(Map<String, dynamic> map) {
    return TimeWorked(
      id: map['id'],
      task: map['task'],
      activity: map['activity'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      duration: Duration(milliseconds: map['duration']),
      description: map['description'],
    );
  }

  factory TimeWorked.fromJson(String source) {
    return TimeWorked.fromMap(json.decode(source));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'activity': activity,
      'date': date.millisecondsSinceEpoch,
      'duration': duration.inMilliseconds,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());
}

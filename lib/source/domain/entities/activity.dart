import 'dart:convert';

class Activity {
  int id;
  int task;
  String description;
  DateTime? startsAt;
  DateTime? endsAt;

  bool get isDone => endsAt != null;

  Activity({
    required this.id,
    required this.task,
    required this.description,
    this.startsAt,
    this.endsAt,
  });

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      task: map['task'],
      description: map['description'],
      startsAt: map['startsAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startsAt'])
          : null,
      endsAt: map['endsAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endsAt'])
          : null,
    );
  }

  factory Activity.fromJson(String source) {
    return Activity.fromMap(json.decode(source));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'description': description,
      'startsAt': startsAt,
      'endsAt': endsAt,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => description;
}

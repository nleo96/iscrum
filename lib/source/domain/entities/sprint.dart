import 'dart:convert';

import './task.dart';

class Sprint {
  int id;
  String name;
  List<Task> tasks = [];
  DateTime? startedAt;
  DateTime? endedAt;

  Sprint({
    required this.id,
    required this.name,
    this.startedAt,
    this.endedAt,
  });

  factory Sprint.fromMap(Map<String, dynamic> map) {
    return Sprint(
      id: map['id'],
      name: map['name'],
      startedAt: map['startsAt'] == null
          ? DateTime.fromMillisecondsSinceEpoch(map['startsAt'])
          : null,
      endedAt: map['endedAt'] == null
          ? DateTime.fromMillisecondsSinceEpoch(map['endedAt'])
          : null,
    );
  }

  factory Sprint.fromJson(String source) => Sprint.fromMap(json.decode(source));

  Set<int> get developers {
    Set<int> developers = {};
    for (Task task in tasks) {
      developers.addAll(task.developers);
    }
    return developers;
  }

  Duration get workedTime {
    return tasks.fold(
      Duration.zero,
      (total, task) => total + task.timeline.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'task': tasks.map((task) => task.toMap()).toList(),
      'startedAt': startedAt?.millisecondsSinceEpoch,
      'endedAt': endedAt?.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());
}

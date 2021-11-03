import 'dart:convert';

import './sprint.dart';
import './task.dart';

class Project {
  int id;
  String name;
  String description;
  List<Sprint> sprints = [];
  int createdBy;
  DateTime createdAt;
  DateTime? endedAt;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.sprints,
    required this.createdBy,
    required this.createdAt,
    this.endedAt,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      sprints: List<Sprint>.from(
        map['sprints']?.map((sprint) => Sprint.fromMap(sprint)),
      ),
      createdBy: map['createdBy'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      endedAt: map['endedAt'] == null
          ? DateTime.fromMillisecondsSinceEpoch(map['endedAt'])
          : null,
    );
  }

  factory Project.fromJson(String source) {
    return Project.fromMap(json.decode(source));
  }

  List<Task> get tasks {
    return sprints.fold(
      [],
      (total, sprint) => total + sprint.tasks,
    );
  }

  Set<int> get developers {
    Set<int> developers = {};
    for (Sprint sprint in sprints) {
      developers.addAll(sprint.developers);
    }
    return developers;
  }

  Duration get workedTime {
    return sprints.fold(
      Duration.zero,
      (total, sprint) => total + sprint.workedTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sprints': sprints.map((x) => x.toMap()).toList(),
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'endedAt': endedAt?.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());
}

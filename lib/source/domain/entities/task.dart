import 'dart:convert';

import './activity.dart';
import './work_timeline.dart';
import '../values/task_priority.dart';

class Task {
  int id;
  int sprint;
  Set<int> developers;
  int? requirement;
  TaskPriority priority;
  String title;
  String? description;
  String? developerNote;
  List<Activity> activities;
  int? state;
  WorkTimeline timeline;
  DateTime createdAt;
  DateTime? startsAt;
  DateTime? endsAt;

  Task({
    required this.id,
    required this.sprint,
    this.developers = const {},
    this.requirement,
    required this.priority,
    required this.title,
    this.description,
    this.developerNote,
    this.activities = const [],
    required this.state,
    WorkTimeline? timeline,
    required this.createdAt,
    this.startsAt,
    this.endsAt,
  }) : timeline = timeline ?? WorkTimeline.empty();

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      sprint: map['sprint'],
      developers: Set.from(map['developers']),
      requirement: map['requirement'],
      priority: TaskPriorities.parse(map['priority']),
      title: map['title'],
      description: map['description'],
      developerNote: map['developerNote'],
      activities: List<Activity>.from(
        map['activities']?.map((activity) => Activity.fromMap(activity)) ?? [],
      ),
      state: map['state'],
      timeline: WorkTimeline.fromMap(map['timeline']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      startsAt: (() {
        if (map['startsAt'] == null) return null;
        return DateTime.fromMillisecondsSinceEpoch(map['startsAt']);
      })(),
      endsAt: (() {
        if (map['endsAt'] == null) return null;
        return DateTime.fromMillisecondsSinceEpoch(map['endsAt']);
      })(),
    );
  }

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sprint': sprint,
      'developers': developers,
      'requirement': requirement,
      'priority': priority,
      'title': title,
      'description': description,
      'developerNote': developerNote,
      'activities': activities.map((activity) => activity.toMap()).toList(),
      'state': state,
      'timeline': timeline.toMap(),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'startsAt': startsAt?.millisecondsSinceEpoch,
      'endsAt': endsAt?.microsecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());
}

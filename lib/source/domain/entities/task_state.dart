import 'dart:convert';

class TaskState {
  int id;
  String name;

  TaskState({
    required this.id,
    required this.name,
  });

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      id: map['id'],
      name: map['name'],
    );
  }

  factory TaskState.fromJson(String source) {
    return TaskState.fromMap(json.decode(source));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => name;
}

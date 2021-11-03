class TaskPriority with Comparable<TaskPriority> {
  final int level;
  final String alias;

  const TaskPriority._({
    required this.level,
    required this.alias,
  });

  bool operator >(TaskPriority other) => level > other.level;

  bool operator >=(TaskPriority other) => level >= other.level;

  bool operator <(TaskPriority other) => level < other.level;

  bool operator <=(TaskPriority other) => level <= other.level;

  @override
  int compareTo(TaskPriority other) => level.compareTo(other.level);

  @override
  String toString() => level.toString();
}

abstract class TaskPriorities {
  static const TaskPriority critical = TaskPriority._(
    level: 0,
    alias: 'Crítico',
  );

  static const TaskPriority urgent = TaskPriority._(
    level: 1,
    alias: 'Urgente',
  );

  static const TaskPriority serious = TaskPriority._(
    level: 2,
    alias: 'Grave',
  );

  static const TaskPriority highest = TaskPriority._(
    level: 3,
    alias: 'Altíssimo',
  );

  static const TaskPriority high = TaskPriority._(
    level: 4,
    alias: 'Alto',
  );

  static const TaskPriority normal = TaskPriority._(
    level: 5,
    alias: 'Normal',
  );

  static const TaskPriority low = TaskPriority._(
    level: 6,
    alias: 'Baixo',
  );

  static const TaskPriority lowest = TaskPriority._(
    level: 7,
    alias: 'Baixíssimo',
  );

  static const List<TaskPriority> values = [
    critical,
    urgent,
    serious,
    highest,
    high,
    normal,
    low,
    lowest,
  ];

  static TaskPriority parse(int level) {
    return values.firstWhere((priority) => priority.level == level);
  }

  static TaskPriority? tryParse(int level) {
    try {
      return parse(level);
    } catch (_) {
      return null;
    }
  }
}

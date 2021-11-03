import 'dart:convert';

import './time_worked.dart';

class WorkTimeline {
  List<TimeWorked> times;

  Duration get duration {
    return times.fold(
      Duration.zero,
      (total, interval) => total + interval.duration,
    );
  }

  WorkTimeline(this.times);

  WorkTimeline.empty() : times = [];

  factory WorkTimeline.fromMap(Map<String, dynamic> map) {
    return WorkTimeline(
      List<TimeWorked>.from(
        map['times'].map((interval) => TimeWorked.fromMap(interval)),
      ),
    );
  }

  factory WorkTimeline.fromJson(String source) {
    return WorkTimeline.fromMap(json.decode(source));
  }

  Map<String, dynamic> toMap() {
    return {
      'times': times.map((interval) => interval.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

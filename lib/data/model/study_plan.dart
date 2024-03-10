import 'dart:convert';

class StudyPlan {
  final int id;
  final int subjectId;
  final DateTime date;
  final bool alarm;
  final bool notification;

  StudyPlan({
    required this.id,
    required this.subjectId,
    required this.date,
    required this.alarm,
    required this.notification,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subjectId': subjectId,
      'date': date.millisecondsSinceEpoch,
      'alarm': alarm,
      'notification': notification,
    };
  }

  factory StudyPlan.fromMap(Map<String, dynamic> map) {
    return StudyPlan(
      id: map['id'] as int,
      subjectId: map['subjectId'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      alarm: map['alarm'] as bool,
      notification: map['notification'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudyPlan.fromJson(String source) =>
      StudyPlan.fromMap(json.decode(source) as Map<String, dynamic>);

  StudyPlan copyWith({
    int? id,
    int? subjectId,
    DateTime? date,
    bool? alarm,
    bool? notification,
  }) {
    return StudyPlan(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      date: date ?? this.date,
      alarm: alarm ?? this.alarm,
      notification: notification ?? this.notification,
    );
  }

  @override
  bool operator ==(covariant StudyPlan other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.subjectId == subjectId &&
        other.date == date &&
        other.alarm == alarm &&
        other.notification == notification;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subjectId.hashCode ^
        date.hashCode ^
        alarm.hashCode ^
        notification.hashCode;
  }
}

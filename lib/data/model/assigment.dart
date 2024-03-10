import 'dart:convert';

class Assigment {
  final int id;
  final int subjectId;
  final DateTime deadline;
  final String description;
  final DateTime plan;
  final bool alarm;
  final bool notification;

  Assigment({
    required this.id,
    required this.subjectId,
    required this.deadline,
    required this.description,
    required this.plan,
    required this.alarm,
    required this.notification,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subjectId': subjectId,
      'deadline': deadline.millisecondsSinceEpoch,
      'description': description,
      'plan': plan.millisecondsSinceEpoch,
      'alarm': alarm,
      'notification': notification,
    };
  }

  factory Assigment.fromMap(Map<String, dynamic> map) {
    return Assigment(
      id: map['id'] as int,
      subjectId: map['subjectId'] as int,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] as int),
      description: map['description'] as String,
      plan: DateTime.fromMillisecondsSinceEpoch(map['plan'] as int),
      alarm: map['alarm'] as bool,
      notification: map['notification'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Assigment.fromJson(String source) =>
      Assigment.fromMap(json.decode(source) as Map<String, dynamic>);

  Assigment copyWith({
    int? id,
    int? subjectId,
    DateTime? deadline,
    String? description,
    DateTime? plan,
    bool? alarm,
    bool? notification,
  }) {
    return Assigment(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      deadline: deadline ?? this.deadline,
      description: description ?? this.description,
      plan: plan ?? this.plan,
      alarm: alarm ?? this.alarm,
      notification: notification ?? this.notification,
    );
  }

  @override
  bool operator ==(covariant Assigment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.subjectId == subjectId &&
        other.deadline == deadline &&
        other.description == description &&
        other.plan == plan &&
        other.alarm == alarm &&
        other.notification == notification;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subjectId.hashCode ^
        deadline.hashCode ^
        description.hashCode ^
        plan.hashCode ^
        alarm.hashCode ^
        notification.hashCode;
  }
}

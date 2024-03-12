import 'dart:convert';

import 'package:flutter/material.dart';

class Subject {
  final int? id;
  final String name;
  final String description;
  final int day;
  final TimeOfDay start;
  final TimeOfDay end;
  final Color color;
  final String location;

  Subject({
    this.id,
    required this.name,
    required this.description,
    required this.start,
    required this.end,
    required this.location,
    required this.color,
    required this.day,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'day': day,
      'color': color.value,
      'start':
          '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}',
      'end':
          "${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}",
      'location': location,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    var startParts =
        (map['start'] as String).split(':').map(int.parse).toList();
    var endParts = (map['end'] as String).split(':').map(int.parse).toList();

    return Subject(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      day: map['day'] as int,
      color: Color(map['color']),
      start: TimeOfDay(hour: startParts[0], minute: startParts[1]),
      end: TimeOfDay(hour: endParts[0], minute: endParts[1]),
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source) as Map<String, dynamic>);

  Subject copyWith({
    int? id,
    String? name,
    String? description,
    int? day,
    TimeOfDay? start,
    Color? color,
    TimeOfDay? end,
    String? location,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      day: day ?? this.day,
      start: start ?? this.start,
      color: color ?? this.color,
      end: end ?? this.end,
      location: location ?? this.location,
    );
  }

  @override
  bool operator ==(covariant Subject other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.day == day &&
        other.color == color &&
        other.start == start &&
        other.end == end &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        day.hashCode ^
        start.hashCode ^
        color.hashCode ^
        end.hashCode ^
        location.hashCode;
  }
}

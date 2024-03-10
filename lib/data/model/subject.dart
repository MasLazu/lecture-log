import 'dart:convert';

class Subject {
  final int id;
  final String name;
  final String description;
  final DateTime start;
  final DateTime end;
  final String location;

  Subject({
    required this.id,
    required this.name,
    required this.description,
    required this.start,
    required this.end,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'location': location,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      start: DateTime.fromMillisecondsSinceEpoch(map['start'] as int),
      end: DateTime.fromMillisecondsSinceEpoch(map['end'] as int),
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
    DateTime? start,
    DateTime? end,
    String? location,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      start: start ?? this.start,
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
        other.start == start &&
        other.end == end &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        start.hashCode ^
        end.hashCode ^
        location.hashCode;
  }
}

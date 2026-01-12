import 'package:cloud_firestore/cloud_firestore.dart';

enum MoodType {
  great,
  good,
  okay,
  bad,
  awful,
}

extension MoodTypeExtension on MoodType {
  String get emoji {
    switch (this) {
      case MoodType.great:
        return '😄';
      case MoodType.good:
        return '🙂';
      case MoodType.okay:
        return '😐';
      case MoodType.bad:
        return '😔';
      case MoodType.awful:
        return '😢';
    }
  }

  String get label {
    switch (this) {
      case MoodType.great:
        return 'Great';
      case MoodType.good:
        return 'Good';
      case MoodType.okay:
        return 'Okay';
      case MoodType.bad:
        return 'Bad';
      case MoodType.awful:
        return 'Awful';
    }
  }

  int get value {
    switch (this) {
      case MoodType.great:
        return 5;
      case MoodType.good:
        return 4;
      case MoodType.okay:
        return 3;
      case MoodType.bad:
        return 2;
      case MoodType.awful:
        return 1;
    }
  }

  static MoodType fromValue(int value) {
    switch (value) {
      case 5:
        return MoodType.great;
      case 4:
        return MoodType.good;
      case 3:
        return MoodType.okay;
      case 2:
        return MoodType.bad;
      case 1:
        return MoodType.awful;
      default:
        return MoodType.okay;
    }
  }
}

class MoodEntry {
  final String id;
  final String userId;
  final MoodType mood;
  final String? note;
  final DateTime createdAt;
  final List<String> activities;

  MoodEntry({
    required this.id,
    required this.userId,
    required this.mood,
    this.note,
    required this.createdAt,
    this.activities = const [],
  });

  factory MoodEntry.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MoodEntry(
      id: doc.id,
      userId: data['userId'] ?? '',
      mood: MoodTypeExtension.fromValue(data['mood'] ?? 3),
      note: data['note'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      activities: List<String>.from(data['activities'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'mood': mood.value,
      'note': note,
      'createdAt': Timestamp.fromDate(createdAt),
      'activities': activities,
    };
  }

  MoodEntry copyWith({
    String? id,
    String? userId,
    MoodType? mood,
    String? note,
    DateTime? createdAt,
    List<String>? activities,
  }) {
    return MoodEntry(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      mood: mood ?? this.mood,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      activities: activities ?? this.activities,
    );
  }
}

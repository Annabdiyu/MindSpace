import 'package:cloud_firestore/cloud_firestore.dart';

class JournalEntry {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? prompt;
  final List<String> tags;

  JournalEntry({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.prompt,
    this.tags = const [],
  });

  factory JournalEntry.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return JournalEntry(
      id: doc.id,
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
      prompt: data['prompt'],
      tags: List<String>.from(data['tags'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'prompt': prompt,
      'tags': tags,
    };
  }

  JournalEntry copyWith({
    String? id,
    String? userId,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? prompt,
    List<String>? tags,
  }) {
    return JournalEntry(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      prompt: prompt ?? this.prompt,
      tags: tags ?? this.tags,
    );
  }
}

// Guided prompts for journaling
class JournalPrompts {
  static const List<String> prompts = [
    "What are you grateful for today?",
    "Describe a moment that made you smile recently.",
    "What's something you're looking forward to?",
    "Write about a challenge you overcame.",
    "What would you tell your younger self?",
    "Describe your perfect day.",
    "What's something new you learned this week?",
    "Write about someone who inspires you.",
    "What are your top 3 priorities right now?",
    "How are you taking care of yourself today?",
    "What emotions are you feeling right now?",
    "Write about a happy memory.",
    "What's one thing you'd like to improve about yourself?",
    "Describe a place where you feel at peace.",
    "What accomplishment are you most proud of?",
  ];
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String category;
  final String? imageUrl;
  final int readTimeMinutes;
  final DateTime publishedAt;
  final List<String> tags;

  Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    this.imageUrl,
    required this.readTimeMinutes,
    required this.publishedAt,
    this.tags = const [],
  });

  factory Article.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Article(
      id: doc.id,
      title: data['title'] ?? '',
      summary: data['summary'] ?? '',
      content: data['content'] ?? '',
      category: data['category'] ?? '',
      imageUrl: data['imageUrl'],
      readTimeMinutes: data['readTimeMinutes'] ?? 5,
      publishedAt: (data['publishedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      tags: List<String>.from(data['tags'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'summary': summary,
      'content': content,
      'category': category,
      'imageUrl': imageUrl,
      'readTimeMinutes': readTimeMinutes,
      'publishedAt': Timestamp.fromDate(publishedAt),
      'tags': tags,
    };
  }
}

class ArticleCategory {
  static const String stress = 'Stress';
  static const String anxiety = 'Anxiety';
  static const String depression = 'Depression';
  static const String selfEsteem = 'Self-Esteem';
  static const String mindfulness = 'Mindfulness';
  static const String relationships = 'Relationships';
  static const String burnout = 'Burnout';
  static const String sleep = 'Sleep';

  static const List<String> all = [
    stress,
    anxiety,
    depression,
    selfEsteem,
    mindfulness,
    relationships,
    burnout,
    sleep,
  ];
}

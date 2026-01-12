import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityPost {
  final String id;
  final String userId;
  final String? displayName; // null for anonymous posts
  final String content;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;
  final bool isAnonymous;
  final List<String> likedBy;
  final List<String> tags;

  CommunityPost({
    required this.id,
    required this.userId,
    this.displayName,
    required this.content,
    required this.createdAt,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.isAnonymous = true,
    this.likedBy = const [],
    this.tags = const [],
  });

  factory CommunityPost.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CommunityPost(
      id: doc.id,
      userId: data['userId'] ?? '',
      displayName: data['displayName'],
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      likesCount: data['likesCount'] ?? 0,
      commentsCount: data['commentsCount'] ?? 0,
      isAnonymous: data['isAnonymous'] ?? true,
      likedBy: List<String>.from(data['likedBy'] ?? []),
      tags: List<String>.from(data['tags'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'displayName': isAnonymous ? null : displayName,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'isAnonymous': isAnonymous,
      'likedBy': likedBy,
      'tags': tags,
    };
  }

  CommunityPost copyWith({
    String? id,
    String? userId,
    String? displayName,
    String? content,
    DateTime? createdAt,
    int? likesCount,
    int? commentsCount,
    bool? isAnonymous,
    List<String>? likedBy,
    List<String>? tags,
  }) {
    return CommunityPost(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      likedBy: likedBy ?? this.likedBy,
      tags: tags ?? this.tags,
    );
  }

  bool isLikedBy(String userId) => likedBy.contains(userId);
}

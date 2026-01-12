import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_space/models/community_post.dart';

class CommunityService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _postsCollection => _firestore.collection('community');

  // Create a new post
  Future<CommunityPost> createPost({
    required String userId,
    required String content,
    String? displayName,
    bool isAnonymous = true,
    List<String> tags = const [],
  }) async {
    final post = CommunityPost(
      id: '',
      userId: userId,
      displayName: isAnonymous ? null : displayName,
      content: content,
      createdAt: DateTime.now(),
      isAnonymous: isAnonymous,
      tags: tags,
    );

    final docRef = await _postsCollection.add(post.toFirestore());
    return post.copyWith(id: docRef.id);
  }

  // Get all posts
  Stream<List<CommunityPost>> getPosts() {
    return _postsCollection
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => CommunityPost.fromFirestore(doc)).toList());
  }

  // Like a post
  Future<void> likePost({
    required String postId,
    required String userId,
  }) async {
    await _postsCollection.doc(postId).update({
      'likedBy': FieldValue.arrayUnion([userId]),
      'likesCount': FieldValue.increment(1),
    });
  }

  // Unlike a post
  Future<void> unlikePost({
    required String postId,
    required String userId,
  }) async {
    await _postsCollection.doc(postId).update({
      'likedBy': FieldValue.arrayRemove([userId]),
      'likesCount': FieldValue.increment(-1),
    });
  }

  // Delete a post (only by owner)
  Future<void> deletePost({
    required String postId,
    required String userId,
  }) async {
    final doc = await _postsCollection.doc(postId).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      if (data['userId'] == userId) {
        await _postsCollection.doc(postId).delete();
      }
    }
  }

  // Report a post
  Future<void> reportPost({
    required String postId,
    required String reporterId,
    required String reason,
  }) async {
    await _firestore.collection('reports').add({
      'postId': postId,
      'reporterId': reporterId,
      'reason': reason,
      'createdAt': Timestamp.now(),
      'status': 'pending',
    });
  }
}

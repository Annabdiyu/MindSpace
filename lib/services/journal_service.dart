import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_space/models/journal_entry.dart';

class JournalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference _journalsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('journals');
  }

  // Add new journal entry
  Future<JournalEntry> addEntry({
    required String userId,
    required String title,
    required String content,
    String? prompt,
    List<String> tags = const [],
  }) async {
    final entry = JournalEntry(
      id: '',
      userId: userId,
      title: title,
      content: content,
      createdAt: DateTime.now(),
      prompt: prompt,
      tags: tags,
    );

    final docRef = await _journalsCollection(userId).add(entry.toFirestore());
    return entry.copyWith(id: docRef.id);
  }

  // Update journal entry
  Future<void> updateEntry({
    required String userId,
    required String entryId,
    required String title,
    required String content,
    List<String>? tags,
  }) async {
    await _journalsCollection(userId).doc(entryId).update({
      'title': title,
      'content': content,
      'updatedAt': Timestamp.now(),
      if (tags != null) 'tags': tags,
    });
  }

  // Delete journal entry
  Future<void> deleteEntry({
    required String userId,
    required String entryId,
  }) async {
    await _journalsCollection(userId).doc(entryId).delete();
  }

  // Get all journal entries
  Stream<List<JournalEntry>> getEntries(String userId) {
    return _journalsCollection(userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => JournalEntry.fromFirestore(doc)).toList());
  }

  // Get single entry
  Future<JournalEntry?> getEntry({
    required String userId,
    required String entryId,
  }) async {
    final doc = await _journalsCollection(userId).doc(entryId).get();
    if (!doc.exists) return null;
    return JournalEntry.fromFirestore(doc);
  }

  // Search entries
  Future<List<JournalEntry>> searchEntries({
    required String userId,
    required String query,
  }) async {
    final snapshot = await _journalsCollection(userId)
        .orderBy('createdAt', descending: true)
        .get();

    final entries = snapshot.docs
        .map((doc) => JournalEntry.fromFirestore(doc))
        .where((entry) =>
            entry.title.toLowerCase().contains(query.toLowerCase()) ||
            entry.content.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return entries;
  }

  // Get entry count
  Future<int> getEntryCount(String userId) async {
    final snapshot = await _journalsCollection(userId).count().get();
    return snapshot.count ?? 0;
  }
}

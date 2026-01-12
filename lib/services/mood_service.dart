import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_space/models/mood_entry.dart';

class MoodService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get moods collection for a user
  CollectionReference _moodsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('moods');
  }

  // Add a new mood entry
  Future<MoodEntry> addMoodEntry({
    required String userId,
    required MoodType mood,
    String? note,
    List<String> activities = const [],
  }) async {
    final entry = MoodEntry(
      id: '',
      userId: userId,
      mood: mood,
      note: note,
      createdAt: DateTime.now(),
      activities: activities,
    );

    final docRef = await _moodsCollection(userId).add(entry.toFirestore());
    
    // Update user's total mood entries count
    await _firestore.collection('users').doc(userId).update({
      'totalMoodEntries': FieldValue.increment(1),
    });

    return entry.copyWith(id: docRef.id);
  }

  // Get today's mood entry
  Future<MoodEntry?> getTodaysMood(String userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final snapshot = await _moodsCollection(userId)
        .where('createdAt', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('createdAt', isLessThan: Timestamp.fromDate(endOfDay))
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return MoodEntry.fromFirestore(snapshot.docs.first);
  }

  // Get mood entries for a date range
  Future<List<MoodEntry>> getMoodEntries({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final snapshot = await _moodsCollection(userId)
        .where('createdAt', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('createdAt', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => MoodEntry.fromFirestore(doc)).toList();
  }

  // Get last 7 days mood entries
  Future<List<MoodEntry>> getWeeklyMoods(String userId) async {
    final now = DateTime.now();
    final weekAgo = now.subtract(const Duration(days: 7));
    return getMoodEntries(userId: userId, startDate: weekAgo, endDate: now);
  }

  // Get last 30 days mood entries
  Future<List<MoodEntry>> getMonthlyMoods(String userId) async {
    final now = DateTime.now();
    final monthAgo = now.subtract(const Duration(days: 30));
    return getMoodEntries(userId: userId, startDate: monthAgo, endDate: now);
  }

  // Stream of mood entries
  Stream<List<MoodEntry>> moodEntriesStream(String userId) {
    return _moodsCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(30)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => MoodEntry.fromFirestore(doc)).toList());
  }

  // Get mood statistics
  Future<Map<String, dynamic>> getMoodStats(String userId) async {
    final moods = await getMonthlyMoods(userId);
    
    if (moods.isEmpty) {
      return {
        'averageMood': 0.0,
        'totalEntries': 0,
        'mostCommonMood': null,
        'moodDistribution': <MoodType, int>{},
      };
    }

    // Calculate average mood
    final totalValue = moods.fold<int>(0, (sum, entry) => sum + entry.mood.value);
    final averageMood = totalValue / moods.length;

    // Calculate mood distribution
    final distribution = <MoodType, int>{};
    for (final entry in moods) {
      distribution[entry.mood] = (distribution[entry.mood] ?? 0) + 1;
    }

    // Find most common mood
    MoodType? mostCommon;
    int maxCount = 0;
    distribution.forEach((mood, count) {
      if (count > maxCount) {
        maxCount = count;
        mostCommon = mood;
      }
    });

    return {
      'averageMood': averageMood,
      'totalEntries': moods.length,
      'mostCommonMood': mostCommon,
      'moodDistribution': distribution,
    };
  }

  // Calculate streak
  Future<int> calculateStreak(String userId) async {
    final now = DateTime.now();
    int streak = 0;
    
    for (int i = 0; i < 365; i++) {
      final date = now.subtract(Duration(days: i));
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));
      
      final snapshot = await _moodsCollection(userId)
          .where('createdAt', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('createdAt', isLessThan: Timestamp.fromDate(endOfDay))
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        streak++;
      } else if (i > 0) {
        // Break the streak if a day is missed (except today)
        break;
      }
    }
    
    return streak;
  }
}

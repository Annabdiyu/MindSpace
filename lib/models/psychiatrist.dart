import 'package:cloud_firestore/cloud_firestore.dart';

class Psychiatrist {
  final String id;
  final String name;
  final String title;
  final String specialty;
  final String bio;
  final String? photoUrl;
  final double rating;
  final int reviewCount;
  final int experienceYears;
  final List<String> languages;
  final double consultationFee;
  final bool isAvailableOnline;
  final bool isAvailableInPerson;
  final String? clinicAddress;
  final Map<String, List<String>> availability; // day -> time slots

  Psychiatrist({
    required this.id,
    required this.name,
    required this.title,
    required this.specialty,
    required this.bio,
    this.photoUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.experienceYears,
    this.languages = const ['English'],
    required this.consultationFee,
    this.isAvailableOnline = true,
    this.isAvailableInPerson = false,
    this.clinicAddress,
    this.availability = const {},
  });

  factory Psychiatrist.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Psychiatrist(
      id: doc.id,
      name: data['name'] ?? '',
      title: data['title'] ?? '',
      specialty: data['specialty'] ?? '',
      bio: data['bio'] ?? '',
      photoUrl: data['photoUrl'],
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviewCount: data['reviewCount'] ?? 0,
      experienceYears: data['experienceYears'] ?? 0,
      languages: List<String>.from(data['languages'] ?? ['English']),
      consultationFee: (data['consultationFee'] ?? 0.0).toDouble(),
      isAvailableOnline: data['isAvailableOnline'] ?? true,
      isAvailableInPerson: data['isAvailableInPerson'] ?? false,
      clinicAddress: data['clinicAddress'],
      availability: _parseAvailability(data['availability']),
    );
  }

  static Map<String, List<String>> _parseAvailability(dynamic data) {
    if (data == null) return {};
    final Map<String, List<String>> result = {};
    (data as Map<String, dynamic>).forEach((key, value) {
      result[key] = List<String>.from(value ?? []);
    });
    return result;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'title': title,
      'specialty': specialty,
      'bio': bio,
      'photoUrl': photoUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'experienceYears': experienceYears,
      'languages': languages,
      'consultationFee': consultationFee,
      'isAvailableOnline': isAvailableOnline,
      'isAvailableInPerson': isAvailableInPerson,
      'clinicAddress': clinicAddress,
      'availability': availability,
    };
  }
}

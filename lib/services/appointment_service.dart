import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_space/models/psychiatrist.dart';
import 'package:mind_space/models/appointment.dart';

class AppointmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _psychiatristsCollection =>
      _firestore.collection('psychiatrists');

  CollectionReference get _appointmentsCollection =>
      _firestore.collection('appointments');

  // Get all psychiatrists
  Stream<List<Psychiatrist>> getPsychiatrists() {
    return _psychiatristsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Psychiatrist.fromFirestore(doc)).toList());
  }

  // Get psychiatrist by ID
  Future<Psychiatrist?> getPsychiatrist(String id) async {
    final doc = await _psychiatristsCollection.doc(id).get();
    if (!doc.exists) return null;
    return Psychiatrist.fromFirestore(doc);
  }

  // Search psychiatrists
  Future<List<Psychiatrist>> searchPsychiatrists(String query) async {
    final snapshot = await _psychiatristsCollection.get();
    final psychiatrists =
        snapshot.docs.map((doc) => Psychiatrist.fromFirestore(doc)).toList();

    return psychiatrists
        .where((p) =>
            p.name.toLowerCase().contains(query.toLowerCase()) ||
            p.specialty.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Book an appointment
  Future<Appointment> bookAppointment({
    required String userId,
    required Psychiatrist psychiatrist,
    required DateTime date,
    required String timeSlot,
    required AppointmentType type,
    String? notes,
  }) async {
    final appointment = Appointment(
      id: '',
      userId: userId,
      psychiatristId: psychiatrist.id,
      psychiatristName: psychiatrist.name,
      psychiatristPhotoUrl: psychiatrist.photoUrl,
      appointmentDate: date,
      timeSlot: timeSlot,
      type: type,
      status: AppointmentStatus.pending,
      notes: notes,
      createdAt: DateTime.now(),
    );

    final docRef = await _appointmentsCollection.add(appointment.toFirestore());
    return appointment.copyWith(id: docRef.id);
  }

  // Get user's appointments
  Stream<List<Appointment>> getUserAppointments(String userId) {
    return _appointmentsCollection
        .where('userId', isEqualTo: userId)
        .orderBy('appointmentDate', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Appointment.fromFirestore(doc)).toList());
  }

  // Cancel appointment
  Future<void> cancelAppointment(String appointmentId) async {
    await _appointmentsCollection.doc(appointmentId).update({
      'status': 'cancelled',
    });
  }

  // Seed sample psychiatrists (for demo purposes)
  Future<void> seedPsychiatrists() async {
    final snapshot = await _psychiatristsCollection.limit(1).get();
    if (snapshot.docs.isNotEmpty) return; // Already seeded

    final sampleDoctors = [
      Psychiatrist(
        id: '',
        name: 'Dr. Sarah Johnson',
        title: 'MD, Psychiatrist',
        specialty: 'Anxiety & Depression',
        bio: 'Dr. Johnson has over 15 years of experience specializing in anxiety disorders and depression. She uses a combination of cognitive-behavioral therapy and medication management.',
        rating: 4.9,
        reviewCount: 127,
        experienceYears: 15,
        languages: ['English', 'Spanish'],
        consultationFee: 150.0,
        isAvailableOnline: true,
        isAvailableInPerson: true,
        availability: {
          'Monday': ['9:00 AM', '10:00 AM', '2:00 PM', '3:00 PM'],
          'Wednesday': ['9:00 AM', '11:00 AM', '2:00 PM'],
          'Friday': ['10:00 AM', '11:00 AM', '3:00 PM'],
        },
      ),
      Psychiatrist(
        id: '',
        name: 'Dr. Michael Chen',
        title: 'PhD, Clinical Psychologist',
        specialty: 'Trauma & PTSD',
        bio: 'Dr. Chen specializes in trauma-focused therapy and has helped hundreds of patients recover from PTSD. He is trained in EMDR and prolonged exposure therapy.',
        rating: 4.8,
        reviewCount: 89,
        experienceYears: 12,
        languages: ['English', 'Mandarin'],
        consultationFee: 130.0,
        isAvailableOnline: true,
        isAvailableInPerson: false,
        availability: {
          'Tuesday': ['10:00 AM', '11:00 AM', '4:00 PM'],
          'Thursday': ['9:00 AM', '10:00 AM', '2:00 PM', '3:00 PM'],
        },
      ),
      Psychiatrist(
        id: '',
        name: 'Dr. Emily Parker',
        title: 'MD, Child & Adolescent Psychiatrist',
        specialty: 'Youth Mental Health',
        bio: 'Dr. Parker focuses on helping children and teenagers navigate mental health challenges. She creates a safe, supportive environment for young patients.',
        rating: 4.9,
        reviewCount: 156,
        experienceYears: 10,
        languages: ['English'],
        consultationFee: 175.0,
        isAvailableOnline: true,
        isAvailableInPerson: true,
        availability: {
          'Monday': ['2:00 PM', '3:00 PM', '4:00 PM'],
          'Wednesday': ['10:00 AM', '11:00 AM', '2:00 PM'],
          'Friday': ['9:00 AM', '10:00 AM'],
        },
      ),
    ];

    for (final doctor in sampleDoctors) {
      await _psychiatristsCollection.add(doctor.toFirestore());
    }
  }
}

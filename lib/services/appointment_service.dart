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
            snapshot.docs.map((doc) => Appointment.fromFirestore(doc)).toList())
        .handleError((error) {
          print('Error fetching appointments: $error');
          // If there's an index error, the error message will contain a link to create the index
          if (error.toString().contains('index')) {
            print('Please create the required Firestore index using the link in the error message above.');
          }
        });
  }

  // Fallback method without ordering (in case index doesn't exist)
  Stream<List<Appointment>> getUserAppointmentsFallback(String userId) {
    return _appointmentsCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
          final appointments = snapshot.docs
              .map((doc) => Appointment.fromFirestore(doc))
              .toList();
          // Sort in memory instead
          appointments.sort((a, b) => b.appointmentDate.compareTo(a.appointmentDate));
          return appointments;
        });
  }

  // Cancel appointment
  Future<void> cancelAppointment(String appointmentId) async {
    await _appointmentsCollection.doc(appointmentId).update({
      'status': 'cancelled',
    });
  }

  // Clear all existing psychiatrists (for reseeding)
  Future<void> clearPsychiatrists() async {
    final snapshot = await _psychiatristsCollection.get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  // Seed sample psychiatrists (for demo purposes)
  // Set forceReseed to true to clear and reseed with new data
  Future<void> seedPsychiatrists({bool forceReseed = false}) async {
    if (forceReseed) {
      await clearPsychiatrists();
    } else {
      final snapshot = await _psychiatristsCollection.limit(1).get();
      if (snapshot.docs.isNotEmpty) return; // Already seeded
    }

    final sampleDoctors = [
      Psychiatrist(
        id: '',
        name: 'Dr. Alemayehu Bedaso',
        title: 'MD, Senior Psychiatrist',
        specialty: 'General Psychiatry',
        bio: 'Dr. Alemayehu Bedaso is a highly esteemed psychiatrist known for his extensive experience in treating various mental health conditions. With his compassionate and patient-centered approach, he builds strong therapeutic relationships with his patients. Dr. Bedaso stays updated with the latest research and treatment modalities, ensuring that his patients receive evidence-based care. His dedication to comprehensive assessment and personalized treatment has made him one of the most respected psychiatrists in Ethiopia.',
        rating: 4.9,
        reviewCount: 203,
        experienceYears: 18,
        languages: ['Amharic', 'English'],
        consultationFee: 8000.0, // ETB
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
        name: 'Dr. Yirgu Gebretsadik',
        title: 'MD, Child & Adolescent Psychiatrist',
        specialty: 'Child & Adolescent Psychiatry',
        bio: 'Dr. Yirgu Gebretsadik is a renowned expert in child and adolescent psychiatry. With his profound understanding of the unique challenges faced by young individuals, he provides specialized care to children and teenagers struggling with mental health issues. Dr. Gebretsadik is known for his ability to create a safe and nurturing environment for his young patients, building trust and effective communication. His commitment to advocacy and raising awareness of mental health in Ethiopia is commendable.',
        rating: 4.9,
        reviewCount: 178,
        experienceYears: 15,
        languages: ['Amharic', 'English', 'Tigrinya'],
        consultationFee: 7500.0, // ETB
        isAvailableOnline: true,
        isAvailableInPerson: true,
        availability: {
          'Monday': ['2:00 PM', '3:00 PM', '4:00 PM'],
          'Wednesday': ['10:00 AM', '11:00 AM', '2:00 PM'],
          'Friday': ['9:00 AM', '10:00 AM'],
        },
      ),
      Psychiatrist(
        id: '',
        name: 'Dr. Mulugeta Tarekegn',
        title: 'MD, Geriatric Psychiatrist',
        specialty: 'Geriatric Psychiatry',
        bio: 'Dr. Mulugeta Tarekegn is a respected psychiatrist with a specialization in geriatric psychiatry. With Ethiopia\'s aging population, Dr. Tarekegn\'s expertise in this field is invaluable. He offers comprehensive assessments, individualized treatment plans, and ongoing support to older adults facing cognitive and emotional challenges. Dr. Tarekegn\'s compassionate care and commitment to enhancing the quality of life for elderly patients have earned him widespread recognition and trust.',
        rating: 4.8,
        reviewCount: 145,
        experienceYears: 20,
        languages: ['Amharic', 'English'],
        consultationFee: 6000.0, // ETB
        isAvailableOnline: true,
        isAvailableInPerson: false, // Online only
        availability: {
          'Tuesday': ['10:00 AM', '11:00 AM', '4:00 PM'],
          'Thursday': ['9:00 AM', '10:00 AM', '2:00 PM', '3:00 PM'],
        },
      ),
      Psychiatrist(
        id: '',
        name: 'Dr. Bamlaku Enkaba',
        title: 'MD, Addiction Psychiatrist',
        specialty: 'Addiction Psychiatry',
        bio: 'Dr. Bamlaku Enkaba is a leading expert in addiction psychiatry in Ethiopia. With his extensive knowledge and experience, he helps individuals struggling with substance abuse disorders recover and rebuild their lives. Dr. Enkaba employs a holistic approach to treatment, combining evidence-based therapies with empathy and understanding. His dedication to continuous professional development ensures that his patients receive the latest advancements in addiction psychiatry.',
        rating: 4.7,
        reviewCount: 112,
        experienceYears: 14,
        languages: ['Amharic', 'English', 'Oromiffa'],
        consultationFee: 5000.0, // ETB
        isAvailableOnline: true,
        isAvailableInPerson: true,
        availability: {
          'Monday': ['9:00 AM', '10:00 AM', '11:00 AM'],
          'Wednesday': ['2:00 PM', '3:00 PM', '4:00 PM'],
          'Friday': ['10:00 AM', '11:00 AM'],
        },
      ),
      Psychiatrist(
        id: '',
        name: 'Dr. Selamawit Yimer',
        title: 'MD, Psychiatrist',
        specialty: 'Mood Disorders & Anxiety',
        bio: 'Dr. Selamawit Yimer is a well-regarded psychiatrist specializing in mood disorders and anxiety-related conditions. With her expertise, she offers accurate diagnoses, evidence-based treatment options, and compassionate care to her patients. Dr. Yimer\'s non-judgmental and supportive approach creates a safe space for individuals to openly discuss their mental health concerns. Her commitment to ongoing research and her patients\' well-being allows her to provide cutting-edge care.',
        rating: 4.9,
        reviewCount: 189,
        experienceYears: 12,
        languages: ['Amharic', 'English'],
        consultationFee: 7000.0, // ETB
        isAvailableOnline: true,
        isAvailableInPerson: true,
        availability: {
          'Tuesday': ['9:00 AM', '10:00 AM', '2:00 PM'],
          'Thursday': ['10:00 AM', '11:00 AM', '3:00 PM', '4:00 PM'],
          'Saturday': ['9:00 AM', '10:00 AM', '11:00 AM'],
        },
      ),
      Psychiatrist(
        id: '',
        name: 'Dr. Tesfaye Mulatu',
        title: 'MD, Trauma Psychiatrist',
        specialty: 'Trauma & PTSD',
        bio: 'Dr. Tesfaye Mulatu is a dedicated psychiatrist who focuses on providing high-quality care to individuals with trauma-related mental health conditions. His specialized training and experience in trauma psychiatry enable him to employ effective treatment approaches tailored to the unique needs of trauma survivors. Dr. Mulatu\'s compassionate and patient-centered approach has helped numerous individuals heal and regain control of their lives.',
        rating: 4.8,
        reviewCount: 134,
        experienceYears: 16,
        languages: ['Amharic', 'English'],
        consultationFee: 6500.0, // ETB
        isAvailableOnline: true,
        isAvailableInPerson: false, // Online only
        availability: {
          'Monday': ['10:00 AM', '11:00 AM', '3:00 PM'],
          'Wednesday': ['9:00 AM', '10:00 AM', '2:00 PM', '3:00 PM'],
          'Friday': ['2:00 PM', '3:00 PM', '4:00 PM'],
        },
      ),
    ];

    for (final doctor in sampleDoctors) {
      await _psychiatristsCollection.add(doctor.toFirestore());
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

enum AppointmentStatus {
  pending,
  confirmed,
  completed,
  cancelled,
}

extension AppointmentStatusExtension on AppointmentStatus {
  String get label {
    switch (this) {
      case AppointmentStatus.pending:
        return 'Pending';
      case AppointmentStatus.confirmed:
        return 'Confirmed';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
    }
  }

  static AppointmentStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'confirmed':
        return AppointmentStatus.confirmed;
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.pending;
    }
  }
}

enum AppointmentType {
  online,
  inPerson,
}

class Appointment {
  final String id;
  final String userId;
  final String psychiatristId;
  final String psychiatristName;
  final String? psychiatristPhotoUrl;
  final DateTime appointmentDate;
  final String timeSlot;
  final AppointmentType type;
  final AppointmentStatus status;
  final String? notes;
  final DateTime createdAt;

  Appointment({
    required this.id,
    required this.userId,
    required this.psychiatristId,
    required this.psychiatristName,
    this.psychiatristPhotoUrl,
    required this.appointmentDate,
    required this.timeSlot,
    required this.type,
    this.status = AppointmentStatus.pending,
    this.notes,
    required this.createdAt,
  });

  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Appointment(
      id: doc.id,
      userId: data['userId'] ?? '',
      psychiatristId: data['psychiatristId'] ?? '',
      psychiatristName: data['psychiatristName'] ?? '',
      psychiatristPhotoUrl: data['psychiatristPhotoUrl'],
      appointmentDate: (data['appointmentDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      timeSlot: data['timeSlot'] ?? '',
      type: data['type'] == 'online' ? AppointmentType.online : AppointmentType.inPerson,
      status: AppointmentStatusExtension.fromString(data['status'] ?? 'pending'),
      notes: data['notes'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'psychiatristId': psychiatristId,
      'psychiatristName': psychiatristName,
      'psychiatristPhotoUrl': psychiatristPhotoUrl,
      'appointmentDate': Timestamp.fromDate(appointmentDate),
      'timeSlot': timeSlot,
      'type': type == AppointmentType.online ? 'online' : 'inPerson',
      'status': status.label.toLowerCase(),
      'notes': notes,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  Appointment copyWith({
    String? id,
    String? userId,
    String? psychiatristId,
    String? psychiatristName,
    String? psychiatristPhotoUrl,
    DateTime? appointmentDate,
    String? timeSlot,
    AppointmentType? type,
    AppointmentStatus? status,
    String? notes,
    DateTime? createdAt,
  }) {
    return Appointment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      psychiatristId: psychiatristId ?? this.psychiatristId,
      psychiatristName: psychiatristName ?? this.psychiatristName,
      psychiatristPhotoUrl: psychiatristPhotoUrl ?? this.psychiatristPhotoUrl,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      timeSlot: timeSlot ?? this.timeSlot,
      type: type ?? this.type,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

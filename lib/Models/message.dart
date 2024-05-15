import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String adminId = "422f8060-2087-4e86-9e2b-db49e10eaf04";
  final String recieverId;
  final String message;
  final Timestamp timestamp;
  final DateTime dateTime;
  final bool isAdmin;

  Message({
    required this.isAdmin,
    required this.recieverId,
    required this.message,
    required this.timestamp,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'recieverId': recieverId,
      'message': message,
      'timestamp': timestamp,
      'dateTime': dateTime,
      'isAdmin': isAdmin,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      recieverId: map['recieverId'],
      message: map['message'],
      timestamp: map['timestamp'],
      isAdmin: map['isAdmin'],
      dateTime: map['dateTime'].toDate(),
    );
  }
}

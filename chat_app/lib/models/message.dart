import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String reciverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.reciverID,
    required this.message,
    required this.timestamp
  });

  // coverting to a map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'reciverID': reciverID,
      'message': message,
      'timestamp': timestamp
    };
  }
}
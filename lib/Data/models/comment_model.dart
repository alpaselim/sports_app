import 'package:cloud_firestore/cloud_firestore.dart';

class Matchh {
  final int matchId;
  final DateTime date;
  final CollectionReference comments;

  Matchh({required this.matchId, required this.date, required this.comments});

  factory Matchh.fromMap(
      Map<String, dynamic> map, CollectionReference comments) {
    return Matchh(
      matchId: map['matchId'],
      date: map['date'].toDate(),
      comments: comments,
    );
  }
}

class Comment {
  //final String commentId;
  final int matchId;
  final String userId;
  final String commentContent;
  final DateTime timestamp;

  Comment({
    //required this.commentId,
    required this.matchId,
    required this.userId,
    required this.commentContent,
    required this.timestamp,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      // Sınıfınıza uygun alanları kullanarak dönüşümü gerçekleştirin
      //commentId: map['commentId'],
      matchId: map['matchId'],
      userId: map['userId'],
      commentContent: map['comment_content'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}

class Userr {
  final String userId;
  final String username;
  final String email;

  Userr({required this.userId, required this.username, required this.email});

  factory Userr.fromMap(Map<String, dynamic> map) {
    return Userr(
      userId: map['userId'],
      username: map['username'],
      email: map['email'],
    );
  }
}

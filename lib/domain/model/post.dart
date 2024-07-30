import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String userId;
  final String title;
  final DateTime dateTime;
  final String imageUrl;
  final String content;
  final String review;

  Post(
      {required this.id,
        required this.userId,
        required this.title,
      required this.dateTime,
      required this.imageUrl,
      required this.content,
      required this.review});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id : json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      imageUrl: json['imageUrl'] as String,
      content: json['content'] as String,
      review: json['review'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'dateTime': dateTime,
      'imageUrl': imageUrl,
      'content': content,
      'review': review,
    };
  }
}

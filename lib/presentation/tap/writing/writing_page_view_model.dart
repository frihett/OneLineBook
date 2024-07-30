import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/model/book.dart';
import '../../../domain/model/post.dart';

class WritingPageViewModel with ChangeNotifier {
  Book? _selectedBook;

  Book? get selectedBook => _selectedBook;

  void setSelectedBook(Book? book) {
    _selectedBook = book;
    notifyListeners();
  }

  Future<void> uploadPost(Book book, String review) async {
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );

    final newPostRef = postsRef.doc();

    newPostRef.set(
      Post(
          id: newPostRef.id,
          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
          title: book.title,
          dateTime: DateTime.now(),
          imageUrl: book.thumbnail,
          content: book.contents,
          review: review),
    );
  }
}

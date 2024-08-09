import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/review.dart';

class ReviewDataSource {
  final _reviewCollectionRef = FirebaseFirestore.instance
      .collection('reviews')
      .withConverter<Review>(
          fromFirestore: (snapshot, _) => Review.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  //Create
  Future<void> createReview({required Review review}) async {
    await _reviewCollectionRef.doc(review.reviewId).set(review);
  }

  //Read
  Future<Review?> getReview({required String reviewId}) async {
    final docSnapshot = await _reviewCollectionRef.doc(reviewId).get();
    return docSnapshot.data();
  }

  //Update
  Future<void> updateReview({required Review review}) async {
    await _reviewCollectionRef.doc(review.reviewId).update(review.toJson());
  }

  //Delete
  Future<void> deleteReview({required String reviewId}) async {
    await _reviewCollectionRef.doc(reviewId).delete();
  }
}

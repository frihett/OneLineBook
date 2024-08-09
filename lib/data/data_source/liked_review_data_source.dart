import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/liked_review.dart';

class LikedReviewDataSource {
  final _likedReviewCollectionRef = FirebaseFirestore.instance
      .collection('likedReviews')
      .withConverter<LikedReview>(
          fromFirestore: (snapshot, _) =>
              LikedReview.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  //Create
  Future<void> createLikedReview({required LikedReview likedReview}) async {
    await _likedReviewCollectionRef
        .doc(likedReview.likedReviewId)
        .set(likedReview);
  }

  //Read
  Future<LikedReview?> getLikedReview({required String likedReviewId}) async {
    final docSnapshot =
        await _likedReviewCollectionRef.doc(likedReviewId).get();
    return docSnapshot.data();
  }

//Update
  Future<void> updateLikedReview({required LikedReview likedReview}) async {
    await _likedReviewCollectionRef
        .doc(likedReview.likedReviewId)
        .update(likedReview.toJson());
  }

//Delete
  Future<void> deleteLikedReview({required String likedReviewId}) async {
    await _likedReviewCollectionRef.doc(likedReviewId).delete();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/model/post.dart';

class ReviewPageViewModel with ChangeNotifier {
  final Stream<QuerySnapshot<Post>> postsStream =
      FirebaseFirestore.instance.collection('posts').withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
          toFirestore: (post, _) => post.toJson(),).snapshots();

}

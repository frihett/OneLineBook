import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/all_review/raking_page_view_model.dart';
import '../../../config/ui_style/ui_style.dart';
import '../../../core/provider/user_provider.dart';
import '../../../domain/model/review.dart';

class RakingPage extends StatefulWidget {
  const RakingPage({super.key});

  @override
  State<RakingPage> createState() => _RakingPageState();
}

class _RakingPageState extends State<RakingPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RakingPageViewModel>();
    final userProvider = context.watch<UserProvider>();
    final userId = userProvider.user?.userId;

    final Stream<QuerySnapshot<Review>> mostLikedReviewsStream =
    FirebaseFirestore.instance
        .collection('reviews')
        .orderBy('likes', descending: true)
        .withConverter(
      fromFirestore: (snapshot, _) => Review.fromJson(snapshot.data()!),
      toFirestore: (review, _) => review.toJson(),
    )
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('모두의 리뷰'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot<Review>>(
            stream: mostLikedReviewsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('오류 발생: ${snapshot.error}'));
              }

              final reviews = snapshot.data?.docs ?? [];

              return ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index].data();
                  return FutureBuilder(
                    future: model.getUser(userId: review.userId),
                    builder: (context, fetchedUserSnapshot) {
                      if (fetchedUserSnapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (fetchedUserSnapshot.hasError) {
                        return Center(child: Text('유저 정보를 불러오는 중 오류 발생: ${fetchedUserSnapshot.error}'));
                      }

                      final fetchedUser = fetchedUserSnapshot.data;
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3E5F5),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Profile Picture
                                CircleAvatar(
                                  backgroundImage: NetworkImage(fetchedUser!.profilePictureUrl),
                                  radius: 20,
                                  backgroundColor: Colors.grey[200],
                                ),
                                SizedBox(width: 12),
                                // User ID and Date
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fetchedUser.userName,
                                      style: UiStyle.bodyStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Text(
                                      DateFormat('yyyy-MM-dd HH:mm:ss').format(
                                        DateTime.fromMillisecondsSinceEpoch(int.parse(review.createdAt)),
                                      ),
                                      style: UiStyle.bodyStyle.copyWith(color: Colors.grey[600], fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            // Review Content
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF6EAF7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '한줄평 - ${review.content}',
                                  style: UiStyle.bodyStyle.copyWith(fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            // Row with Book Image, Title, and Authors
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Book Image
                                review.book.bookImageUrl.isNotEmpty
                                    ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    review.book.bookImageUrl,
                                    height: 120,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : Container(
                                  height: 120,
                                  width: 80,
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 60,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 16),
                                // Book Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Book Title
                                      Text(
                                        review.book.title,
                                        style: UiStyle.h4Style.copyWith(fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 6),
                                      // Book Authors
                                      Text(
                                        review.book.authors.join(', '),
                                        style: UiStyle.bodyStyle.copyWith(color: Colors.grey[700]),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            // Like Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  review.likes.toString(),
                                  style: UiStyle.bodyStyle.copyWith(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    model.toggleLikeReview(
                                      review: review,
                                      userId: userId!,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: review.likedByUserId?.contains(userId) ?? false
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
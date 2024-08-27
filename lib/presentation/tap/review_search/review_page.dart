import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/config/ui_style/ui_style.dart';
import 'package:untitled9/core/provider/user_provider.dart';
import 'package:untitled9/presentation/tap/review_search/review_page_view_model.dart';

import '../../../domain/model/user.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final userId = userProvider.user?.userId;
    final model = context.watch<ReviewPageViewModel>();

    final Stream<DocumentSnapshot<User>> userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        )
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('나의 리뷰'),
      ),
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot<User>>(
          stream: userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('알 수 없는 에러'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final user = snapshot.data?.data();
            if (user == null || user.reviewList == null) {
              return Center(child: Text('리뷰가 없습니다.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: user.reviewList?.length,
              itemBuilder: (BuildContext context, int index) {
                final review = user.reviewList![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Color(0xFFF3E5F5),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(review.book.bookImageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    review.book.title,
                                    style: UiStyle.h4Style.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6EAF7),
                                        borderRadius: BorderRadius.circular(8)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      '한줄평 - ${review.content}',
                                      style: UiStyle.bodyStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon:
                                  Icon(Icons.edit, color: UiStyle.primaryColor),
                              onPressed: () async {
                                final newReviewContent =
                                    await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    String content = review.content;
                                    return AlertDialog(
                                      title: Text('리뷰 수정'),
                                      content: TextField(
                                        onChanged: (value) {
                                          content = value;
                                        },
                                        controller: TextEditingController(
                                            text: review.content),
                                        decoration: InputDecoration(
                                          hintText: "새로운 리뷰 내용을 입력하세요",
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('취소'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('저장'),
                                          onPressed: () {
                                            Navigator.of(context).pop(content);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (newReviewContent != null &&
                                    newReviewContent.isNotEmpty) {
                                  model.editReview(
                                    userId: await userProvider.getUserId(),
                                    reviewContent: newReviewContent,
                                    review: review,
                                  );
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red.withOpacity(0.7)),
                              onPressed: () {
                                model.deleteReview(
                                    userId: userId!, review: review);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

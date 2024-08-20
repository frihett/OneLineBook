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
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<DocumentSnapshot<User>>(
                    stream: userStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('알 수 없는 에러');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final user = snapshot.data?.data();
                      if (user == null || user.reviewList == null) {
                        return const Text('No user data available');
                      }
                      return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: user.reviewList?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final review = user.reviewList![index];
                            return Container(
                              margin: EdgeInsets.only(
                                  right: 16, left: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                  color: UiStyle.secondaryColorSurface,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                    color: UiStyle.primaryColor,
                                    width: 2.0,
                                  )),
                              padding: EdgeInsets.all(16),
                              height: 300,
                              child: Column(
                                children: [
                                  review.book.bookImageUrl.isEmpty == false
                                      ? Image.network(
                                          review.book.bookImageUrl,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(
                                          Icons.image_not_supported,
                                          size: 130,
                                        ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    review.book.title,
                                    // style: UiStyle.h1Style,
                                    // style: UiStyle.h2Style,
                                    // style: UiStyle.h3Style,
                                    style: UiStyle.h4Style,
                                    // style: UiStyle.bodyStyle,
                                    // style: UiStyle.smallStyle,
                                    // style: UiStyle.extraSmallStyle,

                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                    child: Text(
                                      '한줄평 - ${review.content}',
                                      style: UiStyle.bodyStyle,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.white,
                                        )),
                                    width: 400,
                                    height: 49,
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () async {
                                          // 다이얼로그를 열어서 새로운 리뷰 내용을 입력받음
                                          final newReviewContent =
                                              await showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              String content = review
                                                  .content; // 기존 리뷰 내용을 기본값으로 설정
                                              return AlertDialog(
                                                title: Text('리뷰 수정'),
                                                content: TextField(
                                                  onChanged: (value) {
                                                    content =
                                                        value; // 입력된 내용을 content에 저장
                                                  },
                                                  controller:
                                                      TextEditingController(
                                                          text: review.content),
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "새로운 리뷰 내용을 입력하세요",
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('취소'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // 다이얼로그 닫기
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('저장'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop(
                                                          content); // 입력된 내용을 반환하며 다이얼로그 닫기
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          // 사용자가 새로운 내용을 입력하고 저장을 눌렀다면
                                          if (newReviewContent != null &&
                                              newReviewContent.isNotEmpty) {
                                            model.editReview(
                                              userId: userProvider.getUserId(),
                                              reviewContent: newReviewContent,
                                              // 새로 입력된 리뷰 내용 전달
                                              review: review,
                                            );
                                          }
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {
                                          model.deleteReview(
                                              userId: userId!, review: review);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
              )
            ],
          ),
        ));
  }
}

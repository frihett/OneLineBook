import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../config/ui_style/ui_style.dart';
import '../../../domain/model/review.dart';

class AllReviewPage extends StatefulWidget {
  const AllReviewPage({super.key});

  @override
  State<AllReviewPage> createState() => _AllReviewPageState();
}

class _AllReviewPageState extends State<AllReviewPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot<Review>> reviewStream =
        FirebaseFirestore.instance
            .collection('reviews')
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
            child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
                    stream: reviewStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('오류 발생: ${snapshot.error}'));
                      }
                      final reviews = snapshot.data!.docs;

                      return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: reviews.length,
                          itemBuilder: (context, index) {
                            final review = reviews[index].data();
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
                                          onPressed: () {},
                                          icon: Icon(Icons.heart_broken))
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }))
          ],
        )));
  }
}

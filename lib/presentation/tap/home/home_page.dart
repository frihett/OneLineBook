import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/home/home_page_view_model.dart';
import '../../../config/ui_style/ui_style.dart';
import '../../../core/provider/user_provider.dart';
import '../../../domain/model/user.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final userId = userProvider.user?.userId;
    final model = context.watch<HomePageViewModel>();

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
        title: Text('1 Line Reviewer'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onTap: () {
                    context.push('/bookSearching');
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD7D7D7),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    hintText: '도서 검색하기',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 10.0),
                      child: Icon(Icons.search),
                    ),
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '내가 읽고 있는 책 리스트',
                  style: UiStyle.h3Style.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: StreamBuilder<DocumentSnapshot<User>>(
                  stream: userStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot<User>> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('알수 없는 에러'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final user = snapshot.data?.data();

                    if (user == null || user.currentReadingBookList == null) {
                      return const Center(child: Text('현재 읽고있는 책이 없습니다.'));
                    }
                    final sortedList = user.currentReadingBookList?.reversed.toList();


                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 320,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                      ),
                      itemCount: sortedList!.length,
                      itemBuilder: (context, index, realIndex) {
                        final book = sortedList[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          color: Color(0xFFFFEBEE),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      book.bookImageUrl,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    book.title,
                                    style: UiStyle.h4Style
                                        .copyWith(fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    book.authors.join(', '),
                                    style: UiStyle.bodyStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Spacer(),
                                Flexible(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red.withOpacity(0.7)),
                                      onPressed: () {
                                        model.deleteCurrentReadingBook(
                                            userId: userId!, book: book);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '내가 쓴 리뷰 리스트',
                  style: UiStyle.h3Style.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
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
                      return const Center(child: Text('쓴 리뷰가 없습니다.'));
                    }

                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 360,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                      ),
                      itemCount: user.reviewList?.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final review = user.reviewList![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          color: Color(0xFFF3E5F5),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: review.book.bookImageUrl.isNotEmpty
                                        ? Image.network(
                                            review.book.bookImageUrl,
                                            height: 180,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          )
                                        : Icon(
                                            Icons.image_not_supported,
                                            size: 180,
                                          ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    review.book.title,
                                    style: UiStyle.h4Style
                                        .copyWith(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6EAF7),
                                        borderRadius: BorderRadius.circular(8)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '한줄평 - ${review.content}',
                                        style: UiStyle.bodyStyle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit,
                                            color: UiStyle.primaryColor),
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
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('저장'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(content);
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          if (newReviewContent != null &&
                                              newReviewContent.isNotEmpty) {
                                            model.editReview(
                                              userId: await userProvider
                                                  .getUserId(),
                                              reviewContent: newReviewContent,
                                              review: review,
                                            );
                                          }
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red.withOpacity(0.7)),
                                        onPressed: () {
                                          model.deleteReview(
                                              userId: userId!, review: review);
                                        },
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

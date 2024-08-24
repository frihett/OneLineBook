import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      onTap: () {
                        context.push('/bookSearching');
                      },
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        hintText: '도서 검색하기',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('내가 읽고 있는 책 리스트'),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: StreamBuilder<DocumentSnapshot<User>>(
                  stream: userStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot<User>> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    final user = snapshot.data?.data();

                    if (user == null || user.currentReadingBookList == null) {
                      return const Text('No user data available');
                    }

                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 300,
                        // 캐러셀 높이
                        enlargeCenterPage: true,
                        // 중앙 아이템 확대
                        viewportFraction: 0.8,
                        // 화면에 보여질 아이템의 비율
                        enableInfiniteScroll: false,
                        // 무한 스크롤 여부
                        autoPlay: false, // 자동 재생 여부),
                      ),
                      itemCount: user.currentReadingBookList!.length, // 아이템 개수
                      itemBuilder: (context, index, realIndex) {
                        final book = user.currentReadingBookList![index];
                        return GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Image.network(
                                      book.bookImageUrl,
                                      fit: BoxFit.cover,
                                      height: 80,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Align(
                                      child: Text(
                                        book.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    Align(
                                      child: Text(
                                        book.authors.join(', '),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    book.description.isEmpty
                                        ? Text('빔')
                                        : Text(
                                            book.description,
                                            style: TextStyle(fontSize: 16),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 4,
                                  right: 4,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      model.deleteCurrentReadingBook(
                                          userId: userId!, book: book);
                                    },
                                  ))
                            ]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('내가 쓴 리뷰 리스트'),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
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
                      return CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 340,
                            // 캐러셀 높이
                            enlargeCenterPage: true,
                            // 중앙 아이템 확대
                            viewportFraction: 0.8,
                            // 화면에 보여질 아이템의 비율
                            enableInfiniteScroll: false,
                            // 무한 스크롤 여부
                            autoPlay: false, // 자동 재생 여부),
                          ),
                          itemCount: user.reviewList?.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
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
                                              userId: await userProvider
                                                  .getUserId(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

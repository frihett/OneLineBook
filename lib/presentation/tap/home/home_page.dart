import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/home/home_page_view_model.dart';
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
            Expanded(
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

                  return GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 열의 수
                      mainAxisSpacing: 10.0, // 수직 간격
                      crossAxisSpacing: 10.0, // 수평 간격
                      childAspectRatio: 0.7, // 각 아이템의 가로 세로 비율
                    ),
                    itemCount: user.currentReadingBookList!.length, // 아이템 개수
                    itemBuilder: (context, index) {
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
                                  model.deleteCurrentReadingBook(userId: userId!, book: book);
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
          ],
        ),
      ),
    );
  }
}

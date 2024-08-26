import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/core/provider/user_provider.dart';
import 'package:untitled9/presentation/tap/search/search_page_view_model.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  late TextEditingController _controller;
  String query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchPageViewModel>();
    final userProvider = context.watch<UserProvider>();
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
                    controller: _controller,
                    onFieldSubmitted: (value) {
                      setState(() {
                        query = value;
                      });
                      model.fetchBook(query);
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
            Expanded(
              child: ListView.builder(
                itemCount: model.book.length, // 아이템 개수
                itemBuilder: (context, index) {
                  final book = model.book[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/book_detail', extra: book);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    book.bookImageUrl,
                                    fit: BoxFit.cover,
                                    height: 160,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title.length < 14
                                              ? book.title
                                              : book.title.substring(0, 14),
                                          style: TextStyle(fontSize: 20),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          book.authors.toString().length < 23
                                              ? book.authors.toString()
                                              : book.authors
                                                  .toString()
                                                  .substring(0, 23),
                                        ),
                                        Text(
                                          book.description.isEmpty
                                              ? '내용없음'
                                              : book.description,
                                          style: TextStyle(fontSize: 20),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
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

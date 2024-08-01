import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/search/search_page_view_model.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  late TextEditingController _controller;
  String query = '';

  void initState() {
    super.initState();
    _controller = TextEditingController();
    final model = context.read<SearchPageViewModel>();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchPageViewModel>();

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
                      onTap: () {},
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
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // 열의 수
                    mainAxisSpacing: 10.0, // 수직 간격
                    crossAxisSpacing: 10.0, // 수평 간격
                    childAspectRatio: 0.8, // 각 아이템의 가로 세로 비율
                  ),
                  itemCount: model.book.length, // 아이템 개수
                  itemBuilder: (context, index) {
                    final book = model.book[index];
                    return GridTile(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      book.thumbnail,
                                      fit: BoxFit.cover,
                                      height: 80,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
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
                                            overflow: TextOverflow.ellipsis),
                                        Text(book.authors.toString().length < 23
                                            ? book.authors.toString()
                                            : book.authors
                                                .toString()
                                                .substring(0, 23))
                                      ],
                                    )
                                  ],
                                ),
                                Text(DateFormat('yyyy-MM-dd')
                                    .format(book.datetime)),
                                SizedBox(height: 16),
                                Text(
                                  book.contents.isEmpty
                                      ? '내용없음'
                                      : book.contents,
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.comment),
                                      onPressed: () {
                                        context.go('/writing', extra: book);
                                      },
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.favorite_outline),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
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
        ));
  }
}

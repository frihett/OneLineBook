import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled9/tap/search/search_page_view_model.dart';

class SearchPage extends StatefulWidget {
  final SearchPageViewModel searchPageViewModel;

  SearchPage({super.key, required this.searchPageViewModel});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  late TextEditingController _controller;
  String query = '';

  void updateUi() => setState(() {});

  void initState() {
    super.initState();
    _controller = TextEditingController();
    widget.searchPageViewModel.addListener(updateUi);
  }

  void dispose() {
    _controller.dispose();
    widget.searchPageViewModel.removeListener(updateUi);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = widget.searchPageViewModel;

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
                        homePageViewModel.fetchBook(query);
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
                    crossAxisCount: 2, // 열의 수
                    mainAxisSpacing: 10.0, // 수직 간격
                    crossAxisSpacing: 10.0, // 수평 간격
                    childAspectRatio: 0.7, // 각 아이템의 가로 세로 비율
                  ),
                  itemCount: homePageViewModel.book.length, // 아이템 개수
                  itemBuilder: (context, index) {
                    final book = homePageViewModel.book[index];
                    return GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.network(
                                book.thumbnail,
                                fit: BoxFit.cover,
                                height: 80,
                              ),
                              SizedBox(height: 16),
                              Text(query),
                              SizedBox(height: 16),
                              Text(
                                book.contents,
                                style: TextStyle(fontSize: 20),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
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

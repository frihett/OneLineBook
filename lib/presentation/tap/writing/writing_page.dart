import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/writing/writing_page_view_model.dart';

import '../../../domain/model/book.dart';

class WritingPage extends StatefulWidget {
  final Book? book;

  const WritingPage({super.key, this.book});

  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewmodel = context.read<WritingPageViewModel>();
      if (widget.book != null) {
        viewmodel.setSelectedBook(widget.book!);
      }
    });

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WritingPageViewModel>();

    final _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.upload_file),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.done),
            onPressed: () {
              if (model.selectedBook != null) {
                model.uploadPost(model.selectedBook!, _controller.text);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      context.go('/bookSearching');
                    },
                    child: Text('책 검색 하러가기'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                    decoration:
                        BoxDecoration(color: Colors.brown.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(DateFormat('yyyy-MM-dd')
                                .format(DateTime.now())),
                            Spacer(),
                          ],
                        ),
                        Center(
                          child: model.selectedBook?.title == null
                              ? Text('')
                              : Text('${model.selectedBook?.title}'),
                        ),
                        Center(
                          child: model.selectedBook?.thumbnail == null
                              ? Container(height: 300, child: Text('책을 골라주세요 '))
                              : Container(
                                  child: Image.network(
                                    model.selectedBook?.thumbnail ??
                                        'https://image.aladin.co.kr/product/34075/65/cover500/k542931578_1.jpg',
                                    fit: BoxFit.cover,
                                    height: 300,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 24,
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '한문장으로만 리뷰를 써보세요',
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      )),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        maxLines: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a review';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

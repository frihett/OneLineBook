import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/core/provider/user_provider.dart';
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
    final userProvider = context.watch<UserProvider>();
    final userId = userProvider.user?.userId;

    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰 작성'),
        actions: [
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.upload_file),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.done),
            onPressed: () async {
              if (model.selectedBook != null) {
                await model.uploadReview(
                  book: model.selectedBook!,
                  content: _controller.text,
                  userId: userId!,
                );

                context.go('/reviewSearching');
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        model.selectedBook?.title ?? '책 제목',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: model.selectedBook?.bookImageUrl == null
                          ? Container(
                        height: 200,
                        width: 150,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.image_not_supported,
                          size: 100,
                          color: Colors.grey[600],
                        ),
                      )
                          : Image.network(
                        model.selectedBook!.bookImageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 150,
                      ),
                    ),
                    SizedBox(height: 16,),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                '한문장으로만 리뷰를 써보세요',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '리뷰를 입력하세요',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '리뷰를 입력해주세요';
                    }
                    return null;
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
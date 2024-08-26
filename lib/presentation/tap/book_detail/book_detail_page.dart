import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/book_detail/book_detail_page_view_model.dart';
import '../../../domain/model/book.dart';
import '../../../core/provider/user_provider.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;

  BookDetailPage({required this.book});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final model = context.watch<BookDetailPageViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: widget.book.bookImageUrl.isNotEmpty
                  ? Image.network(
                widget.book.bookImageUrl,
                height: 250,

                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // 대체 이미지 표시
                  return Container(
                    color: Colors.grey[200],
                    height: 250,
                    child: Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey[600],
                    ),
                  );
                },
              )
                  : Container(
                color: Colors.grey[200],
                height: 250,
                child: Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${widget.book.authors.join(', ')}', // Join authors list for better formatting
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              widget.book.description.isEmpty
                  ? '내용없음'
                  : widget.book.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final userId = await userProvider.getUserId();
                      model.addCurrentReadingBookList(
                        userId: userId,
                        book: widget.book,
                      );
                      // GoRouter.of(context).pop();
                      context.pop();
                    },
                    child: Text('책 추가하기'),
                  ),
                ),
                SizedBox(width: 16), // Add spacing between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/writing', extra: widget.book);
                    },
                    child: Text('리뷰 쓰러 가기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
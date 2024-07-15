import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritingPage extends StatelessWidget {
  const WritingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.upload_file),
            onPressed: () {
              // 검색 버튼 클릭 시 동작
            },
          ),
          IconButton(
            iconSize: 32,
            icon: Icon(Icons.done), // 오른쪽 아이콘 (더보기)
            onPressed: () {
              // 더보기 버튼 클릭 시 동작
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
                Text('2024.7.15'),
                Center(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDA2MTJfMyAg%2FMDAxNTkxODk0NjQzOTk4.w1tstRuQgP0zlPFZ1n4R74oHfaWaO5s7nLqUtIHT5MMg.47Dz7NjA876MYyYdeu4inMNzsRsTTxuKNI7l89jjzdog.JPEG%2FexternalFile.jpg&type=a340',
                        ),
                      ),
                      Text('2024.7.15'),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Text('한글로만 리뷰를 써보세요'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

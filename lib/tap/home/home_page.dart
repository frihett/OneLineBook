import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        FocusScope.of(context)
                            .requestFocus(FocusNode()); // 현재 필드의 포커스를 해제합니다.
                        // context.pushNamed('search');
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
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 열의 수
                    mainAxisSpacing: 10.0, // 수직 간격
                    crossAxisSpacing: 10.0, // 수평 간격
                    childAspectRatio: 0.7, // 각 아이템의 가로 세로 비율
                  ),
                  itemCount: 10, // 아이템 개수
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: Container(
                        color: Colors.blueGrey[100 * (index % 9)], // 각 타일 색상
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: TextStyle(fontSize: 20),
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

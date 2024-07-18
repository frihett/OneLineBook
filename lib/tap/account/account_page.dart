import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled9/tap/components/my_page_menu_list.dart';

import '../../data_source/book_api.dart';

class AccountPage extends StatelessWidget {

  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 프로필'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                        'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MTFfMTcz%2FMDAxNzE1NDM0ODkxOTQ4.tUiEnLiUgC_c0iIq6zGOZ3ybhaoNzI2IZKDVJwAOt44g.zUFXe0braYWwkuvplm-dyNUrP8higvXg_vu2ml5SETQg.JPEG%2F1715434883266.jpg&type=a340')),
                Column(
                  children: [
                    Text('안녕하세요 xxx님'),
                    SizedBox(
                      height: 12,
                    ),
                    Text('ssgodda@naver.com')
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MyPageMenuList(),
            )
          ],
        ),
      ),
    );
  }
}

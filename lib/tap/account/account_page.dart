import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled9/tap/components/my_page_menu_list.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
                        'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDA2MTJfMyAg%2FMDAxNTkxODk0NjQzOTk4.w1tstRuQgP0zlPFZ1n4R74oHfaWaO5s7nLqUtIHT5MMg.47Dz7NjA876MYyYdeu4inMNzsRsTTxuKNI7l89jjzdog.JPEG%2FexternalFile.jpg&type=a340')),
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

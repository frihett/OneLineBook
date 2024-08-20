import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/user_provider.dart';
import '../components/my_page_menu_list.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final userProvider = context.watch<UserProvider>();

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
                  child: userProvider.user?.profilePictureUrl != null
                      ? Image.network(
                          userProvider.user!.profilePictureUrl.toString())
                      : Icon(Icons.account_circle, size: 100),
                ),
                Column(
                  children: [
                    Text('안녕하세요 ${userProvider.user?.userName}님'),
                    SizedBox(
                      height: 12,
                    ),
                    Text('이메일은 ${userProvider.user?.email ?? '알 수 없음'}'),
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

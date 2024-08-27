import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/presentation/tap/account/account_page_view_model.dart';

import '../../../../core/provider/user_provider.dart';
import 'my_page_menu_bar.dart';

class MyPageMenuList extends StatefulWidget {
  const MyPageMenuList({super.key});

  @override
  State<MyPageMenuList> createState() => _MyPageMenuListState();
}

class _MyPageMenuListState extends State<MyPageMenuList> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AccountViewModel>();
    final userProvider = context.watch<UserProvider>();
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        MyPageMenuBar(menuBarName: '계정설정', menuBarIcon: Icons.chevron_right),
        MyPageMenuBar(menuBarName: '이용약관', menuBarIcon: Icons.chevron_right),
        MyPageMenuBar(
            menuBarName: '계정정보 처리방침', menuBarIcon: Icons.chevron_right),
        MyPageMenuBar(menuBarName: '라이센스', menuBarIcon: Icons.chevron_right),
        MyPageMenuBar(
          menuBarName: '로그아웃',
          menuBarIcon: Icons.account_circle_outlined,
          onTapMenuBar: () async {
            await viewModel.logOut();
            context.go('/login');
          },
        ),
        MyPageMenuBar(
            menuBarName: 'data2', menuBarIcon: Icons.account_circle_outlined),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/core/provider/user_provider.dart';

import 'login_page_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginPageViewModel>();
    final userProvider = context.read<UserProvider>();


    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    final userCredential =
                        await loginViewModel.signInWithGoogle();

                    print('1');
                    print(userCredential);

                    final user =
                        await loginViewModel.setUpUserFromGoogle(userCredential!);

                    await userProvider.saveUser(user); //파이어스토어에 저장

                    final fetchedUser = await userProvider.fetchUser(user.userId!); // 파이어스토어로 부터 유저 가저오기

                    if (fetchedUser != null) {
                      userProvider.setUser(fetchedUser);
                    }
                    if (mounted) {
                      context.go('/home');
                    }
                  },
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/google.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'sign in with google',
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final userCredential =
                    await loginViewModel.signInWithKakao();

                    print('1');
                    print(userCredential);

                    final user =
                    await loginViewModel.setUpUserFromKakao(userCredential!);

                    await userProvider.saveUser(user); //파이어스토어에 저장

                    final fetchedUser = await userProvider.fetchUser(user.userId!); // 파이어스토어로 부터 유저 가저오기

                    if (fetchedUser != null) {
                      userProvider.setUser(fetchedUser);
                    }
                    if (mounted) {
                      context.go('/home');
                    }
                  },
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/kakao.png'),
                        SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

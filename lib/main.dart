import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/data/data_source/user_data_source.dart';
import 'package:untitled9/data/repository/user_repository_impl.dart';
import 'package:untitled9/domain/use_case/create_user_use_case.dart';
import 'config/router/router.dart';
import 'core/provider/user_provider.dart';
import 'domain/use_case/get_user_use_case.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(
          getUserUseCase: GetUserUseCase(
              userRepository:
                  UserRepositoryImpl(userDataSource: UserDataSource())),
          createUserUseCase: CreateUserUseCase(
              userRepository:
                  UserRepositoryImpl(userDataSource: UserDataSource()))),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
        );
      },
    );
  }
}

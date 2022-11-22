import 'package:flutter/material.dart';
import 'package:frontend/pages/boards/board_list_page_ask.dart';
import 'package:frontend/pages/boards/board_list_page_free.dart';
import 'package:frontend/pages/boards/board_list_page_notice.dart';
import 'package:frontend/pages/boards/board_list_page_recipe.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/my_page.dart';
import 'package:frontend/pages/sign_in_page.dart';
import 'package:frontend/pages/sign_up_complete_page.dart';
import 'package:frontend/pages/sign_up_page.dart';
import 'package:frontend/utility/providers/category_provider.dart';
import 'package:frontend/utility/main_color.dart';
import 'package:frontend/utility/providers/board_list_provider.dart';
import 'package:frontend/utility/providers/login_data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => BoardListProvider()),
          ChangeNotifierProvider(create: (BuildContext context) => CategoryProvider()),
          ChangeNotifierProvider(create: (BuildContext context) => LoginDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: MainColor.mainColor,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
        backgroundColor: MainColor.mainColor,
        ),
        textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
        backgroundColor: MainColor.mainColor,
        primary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: Size(300, 45),
        ))),
        title: 'HOME ALONE',
        initialRoute: "/home",
        routes: {
        "/sign-up": (context) => SignUpPage(),
        "/home": (context) => HomePage(),
        "/sign-in": (context) => SignInPage(),
        "/sign-up-complete": (context) =>SignUpCompletePage(),
        "/board-list-free": (context) => BoardListPageFree(),
        "/board-list-ask": (context) => BoardListPageAsk(),
        "/board-list-recipe": (context) => BoardListPageRecipe(),
        "/board-list-notice": (context) => BoardListPageNotice(),
          "/my-page": (context) => MyPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/pages/board_list_page_free.dart';
import 'package:frontend/pages/board_list_page_stls.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/sign_in_page.dart';
import 'package:frontend/pages/sign_up_complete_page.dart';
import 'package:frontend/pages/sign_up_page.dart';
import 'package:frontend/utility/main_color.dart';
import 'package:frontend/utility/provider_test.dart';
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
    return MaterialApp(
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ProviderTest())
        ],
        child:BoardListPageStls()
      ),
      title: 'HOME ALONE',
      initialRoute: "/home",
      /* Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(value: null,
            child: BoardListPageStls()
          )
       */
      routes: {
        "/sign-up": (context) => SignUpPage(),
        "/home": (context) => HomePage(),
        "/sign-in": (context) => SignInPage(),
        "/sign-up-complete": (context) =>SignUpCompletePage(),
        "/board-list-free": (context) => BoardListPageFree(),
        "/board-list-stls": (context) => ChangeNotifierProvider.value(value: null,
        child: BoardListPageStls())
      },
    );
  }
}

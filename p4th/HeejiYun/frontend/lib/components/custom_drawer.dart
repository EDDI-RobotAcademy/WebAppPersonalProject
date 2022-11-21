import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/custom_rich_text.dart';
import 'package:frontend/utility/main_color.dart';

import 'forms/board_register_form.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    String email = "tmp@test.com";
    String nickname = "경수";

    debugPrint(isLogin.toString());
    if (isLogin == true) {
      return _logInDrawer(context, email, nickname);
    }  else {
       return _logOutDrawer(context);
     }
  }
    Widget _logInDrawer(BuildContext context, String email, String nickname) {
      return Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(email),
                accountEmail: Text(nickname),
              ),
              ListTile(
                title: CustomRichText(text: "홈화면 가기", route: "/home"),
              ),
              ExpansionTile(
                title: const Text('게시판 보기'),
                initiallyExpanded: false,
                children: <Widget>[
                  Divider(height: 10,),
                  Container (
                      height: 30,
                      width: 200,
                      child: CustomRichText(text: "자유 게시판", route: "/board-list-free")
                  ),
                  Divider(height: 3,),
                  Container (
                      height: 30,
                      width: 200,
                      child: CustomRichText(text: "질문 게시판", route: "/board-list-ask")
                  ),
                  Divider(height: 3,),
                  Container (
                      height: 30,
                      width: 200,
                      child: CustomRichText(text: "1인분 게시판", route: "/board-list-recipe")
                  )
                ],
              ),
              ListTile(
                title: Text("게시물 작성하기"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => BoardRegisterForm(),
                  ));
                }
              ),
                  ListTile(
                    title: CustomRichText(text: "내 정보 보기", route: "/my-page")
                  ),
                  ListTile(
                    title: CustomRichText(text: "공지사항", route: "/board-list-notice"),
                  ),
            ],
          )
      );
    }

  Widget _logOutDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: CustomRichText(text: "로그인", route: "/sign-in"),
                decoration: BoxDecoration(
                  color: MainColor.mainColor
                )
            ),
            ListTile(
              title: CustomRichText(text: "홈화면 가기", route: "/home"),
            ),
            ExpansionTile(
              title: const Text('게시판 보기'),
              initiallyExpanded: false,
              children: <Widget>[
                Divider(height: 10,),
                Container (
                    height: 30,
                    width: 200,
                    child: CustomRichText(text: "자유게시판", route: "/board-list-free")
                ),
                Divider(height: 3,),
                Container (
                    height: 30,
                    width: 200,
                    child: CustomRichText(text: "자취인 질문 게시판", route: "/board-list-ask")
                ),
                Divider(height: 3,),
                Container (
                    height: 30,
                    width: 200,
                    child: CustomRichText(text: "1인분 레시피 게시판", route: "/board-list-recipe")
                )
              ],
            ),
            ListTile(
              title: CustomRichText(text: "공지사항", route: "/board-list-notice"),
            ),
          ],
        )
    );
  }
}
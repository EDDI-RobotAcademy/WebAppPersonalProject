import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/custom_rich_text.dart';
import 'package:frontend/utility/main_color.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    debugPrint(isLogin.toString());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Visibility(
              visible: !isLogin,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: MainColor.mainColor,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: '로그인',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, "/sign-in");
                              }),
                      ]),
                    ),
                  ),
                ),
          Visibility(
              visible: isLogin,
              child: UserAccountsDrawerHeader(
                accountName: Text("영희"),
                accountEmail: Text("ddd@gmail.com"),
            )
          ),
          ExpansionTile(
            title: const Text('게시판 보기'),
            initiallyExpanded: false,
              children: <Widget>[
                Divider(height: 10,),
                Container (
                  height: 30,
                  width: 200,
                  child: CustomRichText(text: "자유게시판", route: "/board-list-stls")
                  ),
                Divider(height: 3,),
                Container (
                    height: 30,
                    width: 200,
                    child: Text("자취인 질문 게시판")
                ),
                Divider(height: 3,),
                Container (
                    height: 30,
                    width: 200,
                    child: Text("1인분 레시피 공유")
                )
              ],
          ),
          Visibility(
              visible: isLogin,
              child: ListTile(
                title: const Text('나의 정보'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ),
          ListTile(
            title: const Text('홈 화면 이동'),
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          ListTile(
            title: const Text('QnA'),
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          )
        ],
      ),
    );
  }
}
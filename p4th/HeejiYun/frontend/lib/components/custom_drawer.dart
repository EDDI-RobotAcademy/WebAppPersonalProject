import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_member_api.dart';
import 'package:frontend/components/custom_rich_text.dart';
import 'package:frontend/utility/main_color.dart';
import 'package:frontend/utility/providers/login_data_provider.dart';
import 'package:provider/provider.dart';

import '../utility/secure_storage.dart';
import 'custom_alert_dialog.dart';
import 'forms/board_register_form.dart';


class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);


  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late LoginDataProvider _loginDataProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loginDataProvider = Provider.of<LoginDataProvider>(context, listen: true);
    // debugPrint(_loginDataProvider.loginState.toString());
          if(_loginDataProvider.loginState == true) {
            return _logInDrawer(context);
          } else {
            return _logOutDrawer(context);
          }
  }
    Widget _logInDrawer(BuildContext context) {
      return Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(_loginDataProvider.userNickname),
                accountEmail: Text(_loginDataProvider.userEmail),
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
              ListTile(
                title: Text("로그아웃"),
                onTap: () async {
                  SpringMemberApi().requestSignOut(_loginDataProvider.userToken);
                  await SecureStorage.storage.delete(key: 'login');
                  _loginDataProvider.logOut();
                  showResultDialog(context, "로그아웃", "로그아웃이 완료되었습니다.");
                  // 토큰 삭제 요청 api
                },
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

  void showResultDialog(BuildContext context, String title, String alertMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomAlertDialog(title: title, alertMsg: alertMsg));
  }
}
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_in_page.dart';
import 'package:lol_esports_korea_app/utility/size.dart';

import '../api/authentication/spring_member_api.dart';
import '../components/app_bar/common_top_app_bar.dart';
import '../utility/common_alert_dialog.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  static const _storage = FlutterSecureStorage();
  dynamic userInfo = '';
  dynamic email = '';

  /// 로그아웃 후 Dialog 띄우기
  logout() async {
    await _storage.delete(key: 'userToken');
    _signOutSuccessShowDialog();
  }

  /// 로그인 정보 불러오기
  Future<void> checkUserState() async {
    try {
      userInfo = await _storage.read(key: 'userToken');
      email = await _storage.read(key: 'email');
      if (userInfo == null) {
        debugPrint('로그인 페이지로 이동');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        setState(() {
          email = email;
        });
        debugPrint('회원 접속중');
      }
    } catch (e) {
      debugPrint('e');
    }
  }

  /// 회원 탈퇴 요청
  _memberRemoveAction() async {
    await SpringHttpApi().memberRemoveApi(email);

    if (SpringHttpApi.removeResponse.statusCode == 200) {
      await _storage.delete(key: 'userToken');
      _removeSuccessShowDialog();
    } else {
      debugPrint('통신 실패');
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkUserState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopAppBar(
        title: const Text('Setting'),
        appBar: AppBar(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  logout();
                },
                child: const Text(
                  "LOG OUT",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              const SizedBox(height: xmedium_gap),
              ElevatedButton(
                onPressed: () {
                  _memberRemoveAction();
                },
                child: const Text(
                  "회원 탈퇴",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 로그아웃 성공 alertDialog
  void _signOutSuccessShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
              title: "👋️",
              content: '안전하게 로그아웃 되었습니다.',
              onCustomButtonPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
              });
        });
  }

  /// 회원 탈퇴 성공 alertDialog
  void _removeSuccessShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
              title: "👋️",
              content: '탈퇴 되었습니다.',
              onCustomButtonPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
              });
        });
  }
}

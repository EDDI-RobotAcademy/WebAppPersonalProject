import 'package:demo/screens/mypage/change_nickname_screen.dart';
import 'package:demo/screens/mypage/change_password_screen.dart';
import 'package:demo/widgets/mypage/mypage_background.dart';
import 'package:demo/widgets/mypage/mypage_textbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/spring_api.dart';

class MypageForm extends StatefulWidget {
  const MypageForm({Key? key}) : super(key: key);

  @override
  State<MypageForm> createState() => _MypageFormState();
}

class _MypageFormState extends State<MypageForm> {
  static String email = "";
  static String nickname = "";

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      asyncMethod();
    });
    super.initState();
  }

  asyncMethod() async {
    var any = await SharedPreferences.getInstance();
    setState(() {
      email = any.getString("userEmail") ?? '없다';
      nickname = any.getString("userNickname") ?? "없다";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MypageBackground(
      child: Container(
        child: Form(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          '아이디',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      MypageTextbutton(
                        onPressed: () {},
                        text: email,
                        textColor: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          '닉네임',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      MypageTextbutton(
                          text: nickname,
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNicknameScreen()));
                          }),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      MypageTextbutton(
                          text: "로그아웃",
                          textColor: Colors.black,
                          onPressed: () {
                            _showDialogLogout(
                                title: "로그아웃", content: "로그아웃하시겠습니까?");
                          }),
                      MypageTextbutton(
                          text: "비밀번호 변경하기",
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen()));
                          }),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      MypageTextbutton(
                          text: "회원 탈퇴",
                          textColor: Colors.redAccent,
                          onPressed: () {
                            _showDialogWithdrawal(
                                title: "회원탈퇴",
                                content:
                                    nickname + "님 회원탈퇴시 이용했던 정보는 다시 복구가 불가능합니다. 탈퇴하시겠습니까?");
                          }),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _showDialogLogout({String? title, String? content}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(content!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("로그아웃"),
                onPressed: () {
                  SpringApi.logOut();
                },
              ),
            ],
          );
        });
  }

  void _showDialogWithdrawal({String? title, String? content}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(content!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text(
                  "회원탈퇴",
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () {
                  Future<bool?> future = SpringApi().removeAccount(email);
                  future.then((value) {
                    print("회원 탈퇴 성공!");

                  }).catchError((error) {
                    print("회원 탈퇴 실패!");
                    _showDialog(title: '틸퇴 실패', content: '통신상태를 확인해 주세요.');
                  });
                },
              ),
            ],
          );
        });
  }
  void _showDialog({String? title, String? content}){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: Text(title!),
        content: Text(content!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("확인"),
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }
}

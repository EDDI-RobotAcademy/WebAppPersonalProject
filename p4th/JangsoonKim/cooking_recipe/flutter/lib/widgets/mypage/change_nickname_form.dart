import 'package:demo/utilities/spring_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_theme.dart';
import '../../utilities/check_validate.dart';
import '../rounded_button.dart';

class ChangeNicknameForm extends StatefulWidget {
  const ChangeNicknameForm({Key? key}) : super(key: key);

  @override
  State<ChangeNicknameForm> createState() => _ChangeNicknameFormState();
}

class _ChangeNicknameFormState extends State<ChangeNicknameForm> {
  static String nickname = '';
  static String email = '';

  final _formKey = GlobalKey<FormState>();

  final FocusNode _nickNameFocus = FocusNode();

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
      nickname = any.getString("userNickname") ?? "없다";
      email = any.getString("userEmail") ?? "없다";
    });
  }

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppTheme.chalk,
      width: double.infinity,
      height: size.height,
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "닉네임",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                width: size.width,
                child: TextFormField(
                  controller: _controller,
                  validator: (value) =>
                      CheckValidate().validateNickName(_nickNameFocus, value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.black,
                      onPressed: _controller.clear,
                    ),
                    border: InputBorder.none,
                    hintText: nickname,
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Center(
                  child: RoundedButton(
                      text: "확인",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Future<bool?> future = SpringApi().nicknameDuplicate(_controller.text);
                          future.then((value) {
                            print("변경가능한 닉네임");
                            Future<bool?> future2 = SpringApi().changNickname(
                                ChangeNicknameRequest(email, _controller.text));
                            future2.then((bool) {
                              print("닉네임 변경 성공");
                              _showDialog(title: "성공", content: "닉네임 변경에 성공했습니다.");
                            }).catchError((error) {
                              _showDialog(title: "통신 오류", content: "통신 상태를 확인해주세요.");
                              print("닉네임 변경 실패");
                            });
                          }).catchError((error) {
                            print("변경불가 닉네임");
                            _showDialog(title: '변경 불가', content: '이미 사용 중인 닉네임 입니다.');
                          });

                        }
                      },
                      color: Colors.orange,
                      textColor: Colors.white))
            ],
          )),
    );
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
            },
          )
        ],
      );
    });
  }
}

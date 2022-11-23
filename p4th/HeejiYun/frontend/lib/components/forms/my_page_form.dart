import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/text_form_fields/text_form_field_nickname.dart';
import 'package:provider/provider.dart';

import '../../api/spring_member_api.dart';
import '../../utility/providers/login_data_provider.dart';
import '../../utility/secure_storage.dart';
import '../../utility/size.dart';
import '../custom_alert_dialog.dart';

class MyPageForm extends StatefulWidget {
  const MyPageForm({Key? key}) : super(key: key);

  @override
  State<MyPageForm> createState() => _MyPageFormState();
}

class _MyPageFormState extends State<MyPageForm> {

  late TextEditingController nicknameController = TextEditingController();
  late String modifyNickname;
  bool? nicknamePass;

  late LoginDataProvider _loginDataProvider;
  late bool? res;

  @override
  void initState() {
    nicknameController.addListener(() {
      modifyNickname = nicknameController.text;
    });

    _loginDataProvider = Provider.of<LoginDataProvider>(context, listen: false);

    super.initState();
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("현재 닉네임: " + _loginDataProvider.userNickname,
              style: TextStyle(
                fontSize: 25
              )),
              SizedBox(height: large_gap),
              Text("새 닉네임", style: TextStyle(
                  fontSize: 25
              )),
              SizedBox(
                height: medium_gap,
              ),
              TextFormFieldNickname(controller: nicknameController),
              SizedBox(height: medium_gap),
              TextButton(
                onPressed: () async {
                  nicknamePass = await SpringMemberApi().nicknameCheck(modifyNickname);
                  debugPrint("nicknamePass: " + nicknamePass.toString());

                  if(nicknamePass == true) {
                    showResultDialog(context, "닉네임 중복 확인", "사용 가능한 닉네임입니다.");
                  } else {
                    showResultDialog(context, "닉네임 중복 확인", "중복 되는 닉네임입니다.");
                  }

                  TextFormFieldNickname.nicknameFocus.unfocus();

                }, child: const Text("닉네임 중복 확인"),
              ),
              TextButton(onPressed: () async {
                if (_formKey.currentState!.validate() && nicknamePass == true) {
                  res = await SpringMemberApi().
                  requestModifyUserData(ModifyUserDataRequest(_loginDataProvider.userToken.toString(), modifyNickname));
                }
              }, child: const Text("닉네임 변경하기")),
              const SizedBox(
                height: medium_gap,
              ),
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('회원 탈퇴'),
                    content: const Text('회원 탈퇴 하시겠습니까?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('아니오'),
                      ),
                      TextButton(
                        onPressed: () async {
                          res = await SpringMemberApi().requestUnregister(_loginDataProvider.userToken);
                          if(res == true) {
                            await SpringMemberApi().requestSignOut(_loginDataProvider.userToken);
                            await SecureStorage.storage.delete(key: 'login');
                            _loginDataProvider.logOut();
                            Navigator.pushNamed(context, "/home");
                          }
                        },
                        child: const Text('네'),
                      ),
                    ],
                  ),
                ),
                  child: const Text("회원 탈퇴하기")),
          ])
        );
  }

  void showResultDialog(BuildContext context, String title, String alertMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomAlertDialog(title: title, alertMsg: alertMsg));
  }
}

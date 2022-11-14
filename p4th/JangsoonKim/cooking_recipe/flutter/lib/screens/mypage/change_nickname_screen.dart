import 'package:demo/widgets/mypage/change_nickname_form.dart';
import 'package:demo/widgets/mypage/profile_appbar.dart';
import 'package:flutter/material.dart';

class ChangeNicknameScreen extends StatelessWidget {
  const ChangeNicknameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar(),
      body: ChangeNicknameForm(
      ),
    );
  }
}

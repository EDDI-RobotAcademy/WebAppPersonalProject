import 'package:demo/widgets/mypage/change_password_form.dart';
import 'package:demo/widgets/mypage/profile_appbar.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar(),
      body: ChangePasswordFrom(),
    );
  }
}

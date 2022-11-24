import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/api/member_spring_api.dart';
import 'package:look_style/components/signUp/sign_up_form_field.dart';
import 'package:look_style/utility/validation.dart';

class SignUpNicknameTextFormField extends StatefulWidget {
  SignUpNicknameTextFormField({Key? key, this.controller}) : super(key: key);

  final controller;
  static bool? buttonStatus;

  @override
  State<SignUpNicknameTextFormField> createState() =>
      _SignUpNicknameTextFormFieldState();
}

class _SignUpNicknameTextFormFieldState
    extends State<SignUpNicknameTextFormField> {
  String? nickname;
  bool buttonEnable = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      validator: (text) => Validation().validateNickname(text!),
      onChanged: (text) {
        setState(() {
          nickname = text;
          if (Validation().validateNickname(text) == null) {
            buttonEnable = true;
            SignUpNicknameTextFormField.buttonStatus = false;
          }
          if (Validation().validateNickname(text) != null) {
            buttonEnable = false;
          }
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          labelText: "닉네임",
          hintText: "닉네임을 입력해주세요",
          prefixIcon: Icon(Icons.person_outline),
          suffixIcon: Container(
            margin: EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: buttonEnable
                  ? () {
                      var validation = MemberSpringApi().duplicateNicknameValidation(
                          CheckDuplicateNicknameRequest(nickname!));

                      validation.then((value) {
                        if (value.success == true) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  content: Text(
                                    "사용 가능한 닉네임입니다.",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("확인", style: TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                );
                              });
                          setState(() {
                            buttonEnable = false;
                            SignUpNicknameTextFormField.buttonStatus = true;
                            debugPrint("고고 ${SignUpNicknameTextFormField.buttonStatus}");
                          });
                        }
                        if (value.success == false) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  content: Text(
                                    "중복된 닉네임 입니다",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("확인", style: TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                );
                              });
                        }
                      });
                    }
                  : null,
              child: Text("중복 확인"),
            ),
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }
}

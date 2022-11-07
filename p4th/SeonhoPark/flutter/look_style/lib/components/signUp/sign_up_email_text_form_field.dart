import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/api/spring_api.dart';
import 'package:look_style/components/signUp/sign_up_form_field.dart';

import '../../utility/validation.dart';

class SignUpEmailTextFormField extends StatefulWidget {
  SignUpEmailTextFormField({Key? key, this.controller})
      : super(key: key);

  final controller;
  static bool? buttonStatus;



  @override
  State<SignUpEmailTextFormField> createState() => _SignUpEmailTextFieldState();
}

class _SignUpEmailTextFieldState extends State<SignUpEmailTextFormField> {
  String? email;
  bool buttonEnable = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      validator: (text) => Validation().validateEmail(text!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (text) {
        setState(() {
          email = text;
          if (Validation().validateEmail(email!) == null) {
            buttonEnable = true;
            SignUpEmailTextFormField.buttonStatus = false;
          }
          if (Validation().validateEmail(email!) != null) {
            buttonEnable = false;
          }
        });
      },
      decoration: InputDecoration(
          labelText: "이메일",
          hintText: "이메일을 입력해주세요",
          prefixIcon: Icon(Icons.email),
          suffixIcon: Container(
            margin: EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: buttonEnable
                  ? () {
                      var validation = SpringApi().duplicateEmailValidation(
                          UserSignUpDuplicateEmailValidationRequest(email!));



                      validation.then((value) {
                        if (value.success == true) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    "사용 가능한 이메일입니다.",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("확인"),
                                    ),
                                  ],
                                );
                              });
                          setState(() {
                            buttonEnable = false;
                            SignUpEmailTextFormField.buttonStatus = true;
                          });
                        }
                        if (value.success == false) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    "중복된 이메일 입니다.",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("확인"),
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
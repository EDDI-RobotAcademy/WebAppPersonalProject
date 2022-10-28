import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/color.dart';
import '../utility/form_validate.dart';
import '../utility/size.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key, required this.text}) : super(key: key);

  final String text;
  final FocusNode _emailFocus = new FocusNode();
  final FocusNode _passwordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: medium_gap,),
        TextFormField(
          decoration: InputDecoration(
            hintText: "$text 를 입력 하세요",
            enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: colorStyle.mainBlack, width: 1.0)),
            focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: colorStyle.strongBlue, width: 1.0)),
            errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red , width: 1.0)),
            focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: colorStyle.strongBlue, width: 1.0)),
          ),
          keyboardType: text == "Password" ? TextInputType.visiblePassword : TextInputType.emailAddress,
          obscureText: text == "Password" ? true : false,
          focusNode: text == "Password" ? _passwordFocus : _emailFocus,
          autovalidateMode : AutovalidateMode.onUserInteraction ,
          validator: text == "Password" ?
              (value) => CheckValidate().validatePassword(_passwordFocus, value!):
              (value) => CheckValidate().validateEmail(_emailFocus, value!),
        )
      ],
    );
  }
}
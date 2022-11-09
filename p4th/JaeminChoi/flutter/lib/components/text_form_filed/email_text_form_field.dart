import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/decorations/text_style.dart';
import '../../utility/validation/form_validate.dart';
import '../../utility/size.dart';


class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({Key? key , required this.widthSize , required this.usedPosition}) : super(key: key);

  static String email = '';
  final double widthSize;
  final String usedPosition;


  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {

    final FocusNode _emailFocus = FocusNode();

    @override
    Widget build(BuildContext context) {
      return Container(
        width: widget.widthSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Text("Email" , style: defaultTextFieldTextStyle(),textAlign: TextAlign.left,)),
            const SizedBox(height: 7,),
            TextFormField(
              decoration: textFormDecoration("Enter your email"),
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocus,
              autovalidateMode : AutovalidateMode.onUserInteraction ,
              validator: widget.usedPosition == "signIn"?
                  (value) => CheckValidate().validateEmail(_emailFocus, value!)
                  :(value) => CheckValidate().validateEmailInSignUp(_emailFocus, value!),
              onSaved: (value) {
                setState(() {
                  EmailTextFormField.email = value!;
                  });
                },
            )
          ],
        ),
      );
    }
}


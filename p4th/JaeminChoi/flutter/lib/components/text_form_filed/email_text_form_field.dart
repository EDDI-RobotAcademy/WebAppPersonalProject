import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/validation/form_validate.dart';
import '../../utility/size.dart';


class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({Key? key , required this.widthSize}) : super(key: key);

  static String email = '';
  final double widthSize;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: medium_gap,),
            TextFormField(
              decoration: textFormDecoration("이메일"),
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocus,
              autovalidateMode : AutovalidateMode.onUserInteraction ,
              validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
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


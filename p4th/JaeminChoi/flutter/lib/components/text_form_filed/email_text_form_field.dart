import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/form_validate.dart';
import '../../utility/size.dart';


class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({Key? key}) : super(key: key);

  static String email = '';

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {

    FocusNode _emailFocus = new FocusNode();

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: medium_gap,),
          TextFormField(
            decoration: textFormDecoration("이메일을 입력하세요"),
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
      );
    }
}


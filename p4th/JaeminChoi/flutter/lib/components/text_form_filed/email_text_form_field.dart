import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/decorations/text_style.dart';
import '../../utility/validation/form_validate.dart';


class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({Key? key , required this.widthSize , required this.usedPosition, required this.controller}) : super(key: key);

  final TextEditingController controller;
  final double widthSize;
  final String usedPosition;


  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {

    late FocusNode _emailFocus;
    var Controller;
    var CheckOverlapEmail;
    var validateResult;

    void initState() {
      super.initState();
      Controller = widget.controller;
      _emailFocus = FocusNode();
    }

    @override
    void dispose() {
      _emailFocus.dispose();
      super.dispose();
    }

    void checkOverlapEmail() {
      if(validateResult == null){
        CheckOverlapEmail = true;
      }
    }

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
              controller: Controller,
              decoration: textFormDecoration("Enter your email"),
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocus,
              autovalidateMode : AutovalidateMode.onUserInteraction ,
              validator: widget.usedPosition == "signIn"?
                  (value) => CheckValidate().validateEmail(_emailFocus, value!)
                  :(value) => CheckValidate().validateEmailForSignUp(_emailFocus, value!),
              onSaved: (value) {
                setState(() {
                  Controller.text = value!;
                  });
                },
            )
          ],
        ),
      );
    }
}


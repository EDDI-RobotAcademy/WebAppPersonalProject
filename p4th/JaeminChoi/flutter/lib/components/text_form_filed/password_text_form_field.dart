import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/decorations/text_style.dart';
import '../../utility/validation/form_validate.dart';


class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({Key? key , required this.widthSize, required this.controller}) : super(key: key);

  final TextEditingController controller;

  final double widthSize;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {

  late FocusNode _passwordFocus;
  var controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text("Password" , style: defaultTextFieldTextStyle(),textAlign: TextAlign.left,)),
          const SizedBox(height: 7,),
          TextFormField(
            controller: controller,
            decoration: textFormDecoration("Password"),
            obscureText:true,
            obscuringCharacter: '*',
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.visiblePassword,
            focusNode: _passwordFocus,
            autovalidateMode : AutovalidateMode.onUserInteraction ,
            validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
            onSaved: (value) {
              setState(()
              {controller.text = value!;}
              );
            },
          )
        ],
      ),
    );
  }
}

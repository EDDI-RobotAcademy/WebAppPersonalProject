import 'package:flutter/material.dart';

import '../../utility/decorations/text_form_decoration.dart';

class PasswordCheckedTextFormField extends StatefulWidget{
  const PasswordCheckedTextFormField({Key?key ,required this.widthSize, required this.controller}) : super(key:key);

  final TextEditingController controller;
  final double widthSize;

  @override
  State<PasswordCheckedTextFormField> createState() => _PasswordCheckedTextFormField();
}

class _PasswordCheckedTextFormField extends State<PasswordCheckedTextFormField>{

  late FocusNode _PasswordCheckedFocus;
  var controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    _PasswordCheckedFocus = FocusNode();
  }

  @override
  void dispose() {
    _PasswordCheckedFocus.dispose();
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
          TextFormField(
            controller: controller,
            decoration: textFormDecoration("check Password"),
            obscureText:true,
            obscuringCharacter: '*',
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.visiblePassword,
            focusNode: _PasswordCheckedFocus,
            autovalidateMode : AutovalidateMode.onUserInteraction ,
            onSaved: (value) {
              setState(()
              {controller.text = value!;}
              );
            },
          ),
        ],
      ),
    );
  }
}
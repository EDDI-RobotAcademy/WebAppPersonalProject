import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/decorations/text_style.dart';
import '../../utility/validation/form_validate.dart';
import '../../utility/size.dart';


class NickNameTextFormField extends StatefulWidget {
  const NickNameTextFormField({Key? key , required this.widthSize, required this.controller}) : super(key: key);

  final TextEditingController controller;
  final double widthSize;

  @override
  State<NickNameTextFormField> createState() => _NickNameTextFormFieldState();
}

class _NickNameTextFormFieldState extends State<NickNameTextFormField> {

  late FocusNode _NickNameFocus;
  var controller;

  void initState() {
    super.initState();
    controller = widget.controller;
    _NickNameFocus = FocusNode();
  }

  @override
  void dispose() {
    _NickNameFocus.dispose();
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
              child: Text("Nick name" , style: defaultTextFieldTextStyle(),textAlign: TextAlign.left,)),
          const SizedBox(height: 7,),
          TextFormField(
            controller: controller,
            decoration: textFormDecoration("NickName"),
            keyboardType: TextInputType.text,
            focusNode: _NickNameFocus,
            autovalidateMode : AutovalidateMode.onUserInteraction ,
            validator: (value) => CheckValidate().validateNickName(_NickNameFocus, value!),
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

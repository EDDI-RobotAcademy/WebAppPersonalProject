import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/validation/form_validate.dart';
import '../../utility/size.dart';


class NickNameTextFormField extends StatefulWidget {
  const NickNameTextFormField({Key? key , required this.widthSize}) : super(key: key);

  static String nickName = '';
  final double widthSize;
  @override
  State<NickNameTextFormField> createState() => _NickNameTextFormFieldState();
}

class _NickNameTextFormFieldState extends State<NickNameTextFormField> {

  FocusNode _NickNameFocus = new FocusNode();

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
            decoration: textFormDecoration("닉네임"),
            keyboardType: TextInputType.text,
            focusNode: _NickNameFocus,
            autovalidateMode : AutovalidateMode.onUserInteraction ,
            validator: (value) => CheckValidate().validateNickName(_NickNameFocus, value!),
            onSaved: (value) {
              setState(()
              {NickNameTextFormField.nickName = value!;}
              );
            },
          )
        ],
      ),
    );
  }
}

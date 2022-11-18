import 'package:flutter/material.dart';
import '../utility/validation.dart';

class CustomPasswordInput extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  var controller;
  late FocusNode currentFocus;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.clear();
    currentFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          focusNode: currentFocus,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'enter password' ,
              labelStyle: const TextStyle(
                fontFamily: 'FontAppleSDGothicNeo',
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.fromLTRB(4, 16, 8, 8)
          ),
          validator: (value) => CheckValidate().validatePassword(currentFocus, value!),
          onSaved: (value) {
            setState(() {
              controller.text = value;
            });
          },
        )
    );
  }
}

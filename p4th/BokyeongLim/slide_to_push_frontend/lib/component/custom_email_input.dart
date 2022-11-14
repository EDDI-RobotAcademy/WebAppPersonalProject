import 'package:flutter/material.dart';
import '../utility/validation.dart';

class CustomEmailInput extends StatefulWidget {
  final TextEditingController controller;

  const CustomEmailInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomEmailInput> createState() => _CustomEmailInputState();
}

class _CustomEmailInputState extends State<CustomEmailInput> {
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
        keyboardType: TextInputType.emailAddress,
        focusNode: currentFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: 'enter email' ,
            labelStyle: const TextStyle(
              fontFamily: 'FontAppleSDGothicNeo',
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.fromLTRB(4, 16, 8, 8)
        ),
        validator: (value) => CheckValidate().validateEmail(currentFocus, value!),
        onSaved: (value) {
          setState(() {
            controller.text = value;
          });
        },
      )
    );
  }
}


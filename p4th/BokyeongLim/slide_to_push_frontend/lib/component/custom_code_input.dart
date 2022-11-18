import 'package:flutter/material.dart';
import '../utility/validation.dart';

class CustomCodeInput extends StatefulWidget {
  final TextEditingController controller;

  const CustomCodeInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomCodeInput> createState() => _CustomCodeInputState();
}

class _CustomCodeInputState extends State<CustomCodeInput> {
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
          keyboardType: TextInputType.number,
          focusNode: currentFocus,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: 'enter OTP code' ,
              labelStyle: const TextStyle(
                fontFamily: 'FontAppleSDGothicNeo',
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.fromLTRB(4, 16, 8, 8)
          ),
          onSaved: (value) {
            setState(() {
              controller.text = value;
            });
          },
        )
    );
  }
}


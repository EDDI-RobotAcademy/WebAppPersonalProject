import 'package:flutter/material.dart';
import '../utility/validation.dart';

class CustomTodosInput extends StatefulWidget {
  final TextEditingController controller;

  const CustomTodosInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTodosInput> createState() => _CustomTodosInputState();
}

class _CustomTodosInputState extends State<CustomTodosInput> {
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
          keyboardType: TextInputType.text,
          focusNode: currentFocus,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: 'enter todos' ,
              labelStyle: const TextStyle(
                fontFamily: 'FontAppleSDGothicNeo',
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.fromLTRB(4, 16, 8, 8)
          ),
          validator: (value) => CheckValidate().validateText(currentFocus, value!),
          onSaved: (value) {
            setState(() {
              controller.text = value;
            });
          },
        )
    );
  }
}


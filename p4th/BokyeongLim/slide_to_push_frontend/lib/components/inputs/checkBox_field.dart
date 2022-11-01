import 'package:flutter/material.dart';

class CheckBoxField extends StatefulWidget {
  final String title;

  const CheckBoxField({
    Key? key,
    required this.title,
  }) : super(key: key);

  static bool isChecked = false;
  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {

  var title = '';

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      controlAffinity: ListTileControlAffinity.leading, //checkbox at left
      value: CheckBoxField.isChecked,
      onChanged: (bool? value) {
      setState(() {
        CheckBoxField.isChecked = value!;
      });
      },
    );
  }
}
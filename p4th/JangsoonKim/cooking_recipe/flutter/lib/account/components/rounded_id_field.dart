import 'package:demo/components/text_field_contanier.dart';
import 'package:flutter/material.dart';

class RoundedIdField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedIdField(
      {Key? key,
      required this.hinText,
      this.icon = Icons.person,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContanier(
        child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.orange,
          ),
          hintText: hinText,
          border: InputBorder.none),
    ));
  }
}

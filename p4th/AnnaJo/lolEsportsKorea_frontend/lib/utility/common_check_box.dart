import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({Key? key}) : super(key: key);

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Checkbox(value: _isChecked, onChanged: (value){
          setState(() {
            _isChecked = value!;
          });
        })
      ],
    );
  }
}

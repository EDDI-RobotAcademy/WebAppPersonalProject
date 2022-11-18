import 'package:flutter/material.dart';

import '../../utility/decorations/color.dart';
import '../../utility/decorations/text_form_decoration.dart';
import '../../utility/decorations/text_style.dart';

class AdminTextForm extends StatefulWidget{
  const AdminTextForm({Key?key,required this.hintText,required this.smallTitle, required this.controller}) :super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String smallTitle;

  @override
  State<AdminTextForm> createState() => _AdminTextForm();
}

class _AdminTextForm extends State<AdminTextForm> {
  var Controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 25,
                    width: 280,
                    child: Text(widget.smallTitle, style: const TextStyle(color: ColorStyle.defaultButton),textAlign: TextAlign.left,)),
                TextFormField(
                  textAlign: TextAlign.start,
                  decoration: textFormDecorationForAdmin(widget.hintText),
                  controller: Controller,
                  keyboardType: TextInputType.multiline,
                  autovalidateMode : AutovalidateMode.onUserInteraction,
                  minLines: 1,//Normal textInputField will be displayed
                  maxLines: 10,// when user presses enter it will adapt to it
                  onSaved: (value) {
                    setState(() {
                      Controller.text = value!;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void initState(){
    super.initState();
    Controller = widget.controller;
  }
  @override
  void dispose() {
    super.dispose();
  }

}
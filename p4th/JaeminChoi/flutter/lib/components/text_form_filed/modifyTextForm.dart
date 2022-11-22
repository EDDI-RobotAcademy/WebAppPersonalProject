import 'package:flutter/material.dart';

import '../../utility/decorations/color.dart';
import '../../utility/decorations/text_form_decoration.dart';

class ModifyTextForm extends StatefulWidget{
  const ModifyTextForm({Key?key,required this.smallTitle, required this.controller}) :super(key: key);

  final TextEditingController controller;
  final String smallTitle;


  @override
  State<ModifyTextForm> createState() => _ModifyTextForm();
}

class _ModifyTextForm extends State<ModifyTextForm>{
  var Controller;

  @override
  void initState() {
    super.initState();
    Controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  decoration: textFormDecorationForModify(),
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
                SizedBox(height: 25,),
              ],
            ),
          )
        ],
      ),
    );;
  }
}
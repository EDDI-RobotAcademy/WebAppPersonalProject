import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utility/main_color.dart';

import '../../utility/size.dart';

class TextFormFieldForBoard extends StatefulWidget{
  TextFormFieldForBoard({Key? key,
    required this.use, required this.maxLines, required this.controller}) : super(key: key);

  final String use;
  final int maxLines;
  final TextEditingController controller;

  @override
  State<TextFormFieldForBoard> createState() => _TextFormFieldForBoardState();
}

class _TextFormFieldForBoardState extends State<TextFormFieldForBoard> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(widget.use, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          SizedBox(height: small_gap),
            TextFormField(
            validator: (value) => value!.isEmpty ? widget.use + "을 입력하세요" : null,
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.use + "을 입력하세요",
              hoverColor: MainColor.mainColor,
              enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ]
    );
  }
}
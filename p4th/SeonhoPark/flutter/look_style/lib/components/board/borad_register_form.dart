import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardRegisterForm extends StatefulWidget {
  BoardRegisterForm({Key? key, required this.formKey, required this.titleController, required this.contentController}) : super(key: key);

  GlobalKey<FormState> formKey;
  TextEditingController titleController;
  TextEditingController contentController;

  @override
  State<BoardRegisterForm> createState() => _BoardRegisterFormState();
}

class _BoardRegisterFormState extends State<BoardRegisterForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              validator: (text) {
                if(text!.isEmpty) {
                  return '제목을 입력해주세요.';
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.titleController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isDense: true,
                labelText: '제목',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: '제목을 입력하세요.',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: TextFormField(
              validator: (text) {
                if(text!.isEmpty) {
                  return '내용을 입력해주세요.';
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.contentController,
              maxLines: 10,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isDense: true,
                labelText: '내용',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: '내용을 입력하세요.',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

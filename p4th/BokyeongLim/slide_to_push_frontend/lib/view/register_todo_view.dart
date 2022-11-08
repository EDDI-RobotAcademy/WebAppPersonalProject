import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/components/register_todo_form.dart';
class RegisterTodoView extends StatelessWidget {
  const RegisterTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: RegisterTodoForm()
        )
      )
    );
  }
}

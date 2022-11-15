import 'package:flutter/material.dart';
import '../component/register_todos_form.dart';
import '../utility/style/common_text_style.dart';


class RegisterTodosView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Register', style: headerText()),
              SizedBox(height: 20),
              RegisterTodosForm(),
            ],
          )
        ),
      ),
    );
  }
}

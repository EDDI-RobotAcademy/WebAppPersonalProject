import 'package:demo/account/components/signupBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("회원가입", style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: Icon(Icons.arrow_back, color: Colors.grey[700],),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SignupBody()),
    );
  }
}

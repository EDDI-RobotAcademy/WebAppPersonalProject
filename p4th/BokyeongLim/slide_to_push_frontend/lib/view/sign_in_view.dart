import 'package:flutter/material.dart';

import '../component/sign_in_form.dart';
import '../utility/style/common_size.dart';
import '../utility/style/common_text_style.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: xlarge_size),
              Text('Sign In', style: headerText(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('아직 가입하지 않으셨다면', style: defaultText(),),
                  const SizedBox(width:3),
                  TextButton(
                    child: const Text('Sign Up', style: TextStyle(fontSize: 20,),),
                    onPressed: (){}, )
                ]
              ),
              const SizedBox(height: large_size),
              const SignInForm()
            ],
          ),
        ),
      ),
    );
  }
}

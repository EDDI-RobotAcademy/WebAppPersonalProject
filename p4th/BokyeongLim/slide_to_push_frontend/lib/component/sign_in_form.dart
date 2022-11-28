import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/custom_email_input.dart';
import '../component/custom_password_input.dart';
import '../controller/sign_in_controller.dart';
import '../utility/states/authentication.dart';
import '../view/sign_in_view.dart';
import '../view/my_main_view.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignInController signInController = Get.put(SignInController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storage.delete(key: "user");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          key: _formKey,
          children: <Widget>[
            CustomEmailInput( controller: emailController),
            CustomPasswordInput( controller: passwordController),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            //   alignment: Alignment.centerRight,
            //   child: TextButton(child: Text('Forgot Password'), onPressed: (){ Get.to(SignInView()); }),
            // ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 54,
              child: ElevatedButton(
                child: Text('Sign In'),
                onPressed: () async{
                  this._formKey.currentState?.validate();
                  String result =
                    await signInController.signIn(
                        emailController.text, passwordController.text);

                  if(result != "-1") {
                    Get.snackbar(
                      'SUCCESS',
                      '로그인에 성공하였습니다.',
                      backgroundColor: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      'FAILED',
                      '로그인 정보를 확인해주세요',
                      backgroundColor: Colors.white,
                    );
                  }

                  Get.to(() => MyMainView());
                }
              ),
            )
          ],
    ));
  }


}

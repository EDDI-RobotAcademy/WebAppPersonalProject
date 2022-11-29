import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/view/sign_in_view.dart';

import '../auth.config.dart';
import 'custom_email_input.dart';
import '../controller/sign_up_controller.dart';
import '../component/sign_up_second_form.dart';
import '../utility/style/common_size.dart';
import '../utility/style/common_text_style.dart';

class SignUpFirstForm extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    EmailAuth emailAuth = new EmailAuth(
      sessionName: "slide to push",
    );

    /// Configuring the remote server
    emailAuth.config(remoteServerConfiguration);
    void sendOTP(String email) async {
      bool res = await emailAuth.sendOtp(recipientMail: email, otpLength: 5);

      if(res) {
        print("잘 보내짐");
      } else {
        print("잘안됨");
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: xlarge_size),
              Text('Sign Up', style: headerText()),
              SizedBox(height: 10,),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사용하실 이메일을 입력해주세요.', style: defaultText(),),
                    SizedBox(height: xlarge_size),
                    CustomEmailInput(controller: emailController),
                    SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: ElevatedButton(
                          child: Text('Email 중복확인'),
                          onPressed: () async{
                            bool result = await signUpController.checkDuplicatedEmail(emailController.text);

                            if (result) {
                              signUpController.saveEmail = emailController.text;
                              Get.snackbar(
                                'SUCCESS',
                                '사용할 수 있는 이메일입니다.',
                                backgroundColor: Colors.white,
                              );
                              sendOTP(emailController.text);
                              Get.to(() => SignUpSecondForm());
                            } else {
                              Get.snackbar(
                                'FAILED',
                                '사용할 수 없는 이메일입니다.',
                                backgroundColor: Colors.white,
                              );
                              emailController.clear();
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(onPressed: (){Get.off(() => SignInView());}, child: Text('Back'))
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}






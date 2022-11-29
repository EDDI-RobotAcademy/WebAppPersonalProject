import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth.config.dart';
import '../component/sign_up_last_form.dart';
import '../component/sign_up_first_form.dart';
import '../controller/sign_up_controller.dart';
import '../utility/style/common_size.dart';
import '../utility/style/common_text_style.dart';
import 'custom_code_input.dart';

class SignUpSecondForm extends StatelessWidget {
  TextEditingController codeController = TextEditingController();
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
    Future<bool> verify(String code) async{
      print(emailAuth.validateOtp( recipientMail: signUpController.saveEmail, userOtp: code));
      bool result = await emailAuth.validateOtp(recipientMail: signUpController.saveEmail, userOtp: code);
      return result;
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
                    Text('이메일로 인증번호를 전송했습니다.', style: defaultText(),),
                    Text('인증번호를 입력해주세요.', style: defaultText(),),
                    SizedBox(height: xlarge_size),
                    CustomCodeInput(controller:codeController),
                    SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: ElevatedButton(
                          child: Text('확인'),
                          onPressed: () async{
                            bool? result = await verify(codeController.text);
                              if(result) {

                                Get.snackbar(
                                  'SUCCESS',
                                  '인증되었습니다.',
                                  backgroundColor: Colors.white,
                                );

                                Get.to(() => SignUpLastForm());
                              } else {
                                  Get.snackbar(
                                    'FAILED',
                                    '잘못된 인증번호 입니다..',
                                    backgroundColor: Colors.white,
                                  );
                              }
                          }
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(onPressed: (){Get.off(() => SignUpFirstForm());}, child: Text('Back'))
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}

//controller로 옮기기




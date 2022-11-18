import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:leaing_helper/utility/decorations/buttonStyle.dart';

import '../../api/info/sign_in_info.dart';
import '../../api/spring_sign_in_api.dart';
import '../../pages/personal_pages/personal_main_page.dart';
import '../../utility/decorations/color.dart';
import '../../utility/decorations/text_style.dart';
import '../text_form_filed/email_text_form_field.dart';
import '../text_form_filed/password_text_form_field.dart';
import '../../utility/size.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  String accountInfo = "";
  bool isAuthenticated = false;
  bool isSignIn = false;

  late TextEditingController emailEditController;
  late TextEditingController passwordController;
  static final storage = FlutterSecureStorage();

  changeStatus() {
    if (isAuthenticated == true) {
      isSignIn = true;
    } else {
      isSignIn = false;
    }
  }

  saveSignInInfo() async{
    SignInAccount account = SignInAccount(
        emailEditController.text,
        passwordController.text
    );

    await SpringSignInApi().login(account);
    if(SpringSignInApi.response.statusCode == 200) {
      var resToken = SpringSignInApi.response.body;

      isAuthenticated = true;
      await storage.write(key: 'sign_in', value: resToken.toString());
      changeStatus();
      _asyncMethod();
    } else {
      debugPrint(SpringSignInApi.response.body.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    emailEditController = TextEditingController();
    passwordController = TextEditingController();
    storage.deleteAll();
    // 빌드가 끝나고 한번 콜백 해주는 용도
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    accountInfo = (await storage.read(key: "sign_in"))!;
    debugPrint(accountInfo);

    if (accountInfo != null) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => PersonalPage(),
        ),
      );
    } else {
      debugPrint("accountInfo 에 값이 없습니다.");
    }
  }

  @override
  void dispose() {
    emailEditController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: xlarge_gap,),
            SizedBox(
                width: double.infinity,
                child:
                Text(
                  "Welcome to" ,
                  style: welcomeTextStyleBlack(),
                  textAlign: TextAlign.left,)),
            SizedBox(
                width: double.infinity,
                child:
                Text(
                  "LearnTable" ,
                  style: welcomeTextStyleYellow(),
                  textAlign: TextAlign.left,)),
            const SizedBox(height: large_gap),
            EmailTextFormField(widthSize: textFormWidth , usedPosition: "signIn",controller: emailEditController,),
            const SizedBox(height: small_gap),
            PasswordTextFormField(widthSize: textFormWidth, controller: passwordController),
            const SizedBox(height: large_gap),
            const SizedBox(
              width: 275,
              child: Text(
                "Forget password ?",
                style: TextStyle(color: ColorStyle.defaultButton,fontSize: 10),
                textAlign: TextAlign.right,)
            ),
            const SizedBox(height: large_gap),
            ElevatedButton(
              onPressed: (){
                saveSignInInfo();
                },
              child :
              SizedBox(
                  width: double.infinity,
                  child: Text("Log in", style: defaultBtnTextStyle(), textAlign: TextAlign.center,)),
              style: elevatedButtonStyle(medium_btn_width,small_btn_height),
            ),
          ],
        )
    );
  }

}
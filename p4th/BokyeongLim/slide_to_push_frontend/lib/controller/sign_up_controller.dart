import 'package:get/get.dart';
import 'package:email_auth/email_auth.dart';
import '../utility/api/member_service_api.dart';

class SignUpController extends GetxController {
  late String saveEmail = 'maglogue@naver.com';

  EmailAuth emailAuth = EmailAuth(sessionName: "SLIDE TO PUSH");

  Future<bool> checkDuplicatedEmail(String email) async{
    bool result = await MemberService.emailValidation(email);
    print(result.toString());
    return result;
  }
  Future<bool> signUp(String password, String nickname ) async{
    bool result = await MemberService.requestSignUp(  nickname, saveEmail, password, );
    print(result.toString() + "CONTROLLER");
    return result;
  }

  void sendOTP(String email) async {
    bool res = await emailAuth.sendOtp(recipientMail: email, otpLength: 5);

    if(res) {
      print("잘 보내짐");
    } else {
      print("잘안됨");
    }
  }
  Future<bool> verify(String code) async{
    print(emailAuth.validateOtp( recipientMail: saveEmail, userOtp: code));
    bool result = await emailAuth.validateOtp(recipientMail: saveEmail, userOtp: code);
    return result;
  }

}


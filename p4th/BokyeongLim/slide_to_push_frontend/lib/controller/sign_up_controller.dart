import 'package:get/get.dart';
import 'package:email_auth/email_auth.dart';
import '../utility/api/member_service_api.dart';

class SignUpController extends GetxController {
  late String saveEmail = '';




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


}


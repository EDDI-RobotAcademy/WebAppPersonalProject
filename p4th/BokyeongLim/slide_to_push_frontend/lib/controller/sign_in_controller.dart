import 'package:get/get.dart';
import '../utility/states/authentication.dart';
import '../utility/api/member_service_api.dart';

class SignInController extends GetxController {
  final RxBool isAuthenticated = false.obs;

  Future<String> signIn (String email, String password) async{
    String token = await MemberService.requestSignIn(email, password);
    Auth.authToken = token;

    if(token != "-1") {
      isAuthenticated.value = true;
      storage.write(key: 'user', value: token);
    }
    return token;
  }
  void logout(){
    isAuthenticated.value = false;
    storage.delete(key: 'user');
    Auth.authToken = '';
  }
}
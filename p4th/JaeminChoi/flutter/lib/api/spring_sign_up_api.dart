import 'dart:convert';

class SpringSignUpApi {
  static const String httpUri = '192.168.0.8:7777';

  Future<UserSignUpResponse> signUp (UserSignUpRequest request) async {
    var data = { 'email': request.email, 'password': request.password ,'nickName' :request.nicKName };
    var body = json.encode(data);
    

    return UserSignUpResponse(true);
  }
}

class UserSignUpResponse {
  bool? success;

  UserSignUpResponse(this.success);
}

class UserSignUpRequest {
  String email;
  String password;
  String nicKName;

  UserSignUpRequest(this.email, this.password, this.nicKName);
}
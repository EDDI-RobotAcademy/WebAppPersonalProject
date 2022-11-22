import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_member_api.dart';

class LoginDataProvider extends ChangeNotifier{
  bool _loginState = false;
  String? _userToken = '';
  String _userEmail = '';
  String _userNickname = '';

  bool get loginState => _loginState;
  String? get userToken => _userToken;
  String get userEmail => _userEmail;
  String get userNickname => _userNickname;

  void setUserToken(String resToken) {
   _userToken = resToken;
  }

  void logOut() {
    _userToken = '';
    _userEmail = '';
    _userNickname = '';
    _loginState = false;
  }

  void isLogin() {
    _loginState = true;
    notifyListeners();
  }

  void getUserData() async {
      UserDataResponse userRes = await SpringMemberApi().requestUserData(_userToken);
      _userEmail = userRes.userEmail;
      _userNickname = userRes.userNickname;

    notifyListeners();
  }
}
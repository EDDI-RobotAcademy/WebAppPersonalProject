class Validation {
  String? validateEmail(String text) {
    if (text.isEmpty) {
      return "정보를 입력하세요";
    } else if (RegExp(r"^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$").hasMatch(text)) {
      return null;
    }
    return "올바른 이메일을 입력해주세요";
  }

  String? validatePassword(String text) {
    if (text.isEmpty) {
      return "정보를 입력하세요";
    } else if (RegExp(
        r"^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$")
        .hasMatch(text)) {
      return null;
    }
    return "영문, 숫자, 특수문자를 포함한 8~16자를 입력해주세요.";
  }
}
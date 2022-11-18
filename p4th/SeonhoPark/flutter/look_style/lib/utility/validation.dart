class Validation {
  String? validateEmail(String text) {
    if (text.isEmpty) {
      return "이메일을 입력해주세요";
    } else if (RegExp(r"^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$").hasMatch(text)) {
      return null;
    }
    return "이메일 형식을 입력해주세요";
  }

  String? validatePassword(String text) {
    if (text.isEmpty) {
      return "비밀번호를 입력해주세요";
    } else if (RegExp(
        r"^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$")
        .hasMatch(text)) {
      return null;
    }
    return "영문, 숫자, 특수문자 조합으로 8~16자를 입력해주세요";
  }

  String? validateNickname(String text) {
    if (text.isEmpty) {
      return "닉네임을 입력해주세요";
    }
    return null;
  }
}
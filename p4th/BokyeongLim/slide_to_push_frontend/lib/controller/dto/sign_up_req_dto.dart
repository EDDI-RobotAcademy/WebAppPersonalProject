//Data to Object
class SignUpReqDto {
  final String email;
  final String? password;
  final String? nickName;

  SignUpReqDto(this.nickName, this.email, this.password );

  Map<String, dynamic> toJson() => {
    'nickName' : nickName,
    'email' : email,
    'password' : password
  };
}
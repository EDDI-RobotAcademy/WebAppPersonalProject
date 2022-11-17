//Data to Object
class SignUpReqDto {
  final String? nickName;
  final String email;
  final String? password;


  SignUpReqDto(this.nickName, this.email, this.password );

  Map<String, dynamic> toJson() => {
    'nickName' : nickName,
    'email' : email,
    'password' : password
  };
}
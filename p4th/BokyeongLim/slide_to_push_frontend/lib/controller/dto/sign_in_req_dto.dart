//Data to Object
class SignInReqDto {
  final String email;
  final String? password;

  SignInReqDto(this.email, this.password);

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password
  };
}
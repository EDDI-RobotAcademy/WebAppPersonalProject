
class Account{
  final String nickName;
  final String email;
  final String password;

  Account(this.nickName, this.email, this.password);

  Map<String, dynamic> toJson() => {
    'nickName' : nickName,
    'email' : email,
    'password' : password
  };
}
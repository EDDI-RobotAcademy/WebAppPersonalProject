
class SignInAccount{
  final String email;
  final String password;

  SignInAccount(this.email, this.password);

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password
  };
}


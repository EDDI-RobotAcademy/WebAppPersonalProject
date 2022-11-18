class Member{
  String email;
  String password;
  String nickname;
  int memberPoint;

  Member(this.email, this.password, this.nickname, this.memberPoint);

  Member.fromJson(Map<String, dynamic> json)
    : email = json['email'],
      password = json['password'],
      nickname = json['nickname'],
      memberPoint = json['memberPoint'];

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password,
    'nickname' : nickname,
    'memberPoint' : memberPoint
  };
}
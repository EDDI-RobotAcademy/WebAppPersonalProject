class Member {
  String userToken;
  String email;
  String nickname;
  String memberPoint;

  Member(this.userToken, this.email, this.nickname, this.memberPoint);

  Member.fromJson(Map<String, dynamic> json)
      : userToken = json['userToken'],
        email = json['email'],
        nickname = json['nickname'],
        memberPoint = json['memberPoint'];

  Map<String, dynamic> toJson() => {
        'password': userToken,
        'email': email,
        'nickname': nickname,
        'memberPoint': memberPoint
      };
}

import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget(
      {Key? key,
      required this.teamName,
      required this.position,
      required this.rosterName,
      required this.rosterNiCkName,
      required this.profilePic})
      : super(key: key);

  final String teamName;
  final String position;
  final String rosterName;
  final String rosterNiCkName;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          children: [
            Container(
              width: 130,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.centerRight,
                            // 포지션 Icon
                            image: AssetImage("assets/images/team_info/$position.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Text(
                    //선수 활동명
                    rosterNiCkName,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    //선수 이름
                    rosterName,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white30),
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        // 배경 이미지 : 팀 로고
                        image: AssetImage("assets/images/$teamName.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        // 로고 위에 선수 프로필 사진
                        image:
                            AssetImage("assets/images/team_info/$profilePic.png"),
                        fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

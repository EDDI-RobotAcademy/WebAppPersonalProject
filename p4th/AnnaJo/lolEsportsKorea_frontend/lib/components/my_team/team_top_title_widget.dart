import 'package:flutter/material.dart';

class TeamTopTitleWidget extends StatelessWidget {
  const TeamTopTitleWidget(
      {Key? key, required this.teamName, required this.logoName})
      : super(key: key);

  final String teamName;
  final String logoName;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Color(0xff23124b)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage:
                          AssetImage("assets/images/$logoName.png"),
                      backgroundColor: Colors.black)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teamName,
                    style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Text(
                    'LCK - 한국',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),
            ]));
  }
}

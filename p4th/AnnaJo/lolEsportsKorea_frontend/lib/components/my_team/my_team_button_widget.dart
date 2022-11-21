import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/utility/size.dart';

class MyTeamButtonWidget extends StatelessWidget {
  const MyTeamButtonWidget(
      {Key? key,
      required this.teamName,
      required this.logoName,
      required this.onCustomButtonPressed})
      : super(key: key);

  final String teamName;
  final String logoName;
  final VoidCallback onCustomButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 150.0,
      width: 185.0,
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [Colors.black, Color(0xff23124b)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage("assets/images/$logoName.png"),
                        backgroundColor: Colors.black)),
                Text(
                  teamName,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: large_gap),
            Row(
              children: [
                const SizedBox(width: 120),
                InkWell(
                  onTap: () {
                    onCustomButtonPressed.call();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.deepPurple),
                      child: const Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 25.0,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

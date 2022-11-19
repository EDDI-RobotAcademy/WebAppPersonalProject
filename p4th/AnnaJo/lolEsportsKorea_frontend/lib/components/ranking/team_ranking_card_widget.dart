import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/ranking/ranking_text_clear_box.dart';
import 'package:lol_esports_korea_app/components/ranking/ranking_text_color_box.dart';
import 'package:lol_esports_korea_app/components/ranking/team_ranking_data.dart';

class TeamTankingCardWidget extends StatelessWidget {
  final int index;
  final List<TeamRankingData> list;

  TeamTankingCardWidget({
    required this.index,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    var team;
    switch (list[index].teamName) {
      case 'T1':
        team = 'T1';
        break;
      case 'DRX':
        team = 'DRX';
        break;
      case '젠지':
        team = 'GEN';
        break;
      case '농심':
        team = 'NS';
        break;
      case '리브 샌박':
        team = 'LSB';
        break;
      case 'KT':
        team = 'KT';
        break;
      case '담원 기아':
        team = 'DK';
        break;
      case '한화생명':
        team = 'HLE';
        break;
      case '광동':
        team = 'KDF';
        break;
      case '프레딧':
        team = 'BRO';
        break;
    }

    return Container(
      height: 150.0,
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.indigo],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp)),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("assets/images/$team.png"),
                backgroundColor: Colors.black)),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    list[index].ranking + ". " + list[index].teamName,
                    style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: const [
                          RankingTextColorBox(title: '승'),
                          RankingTextColorBox(title: '패'),
                          RankingTextColorBox(title: '득실차'),
                          RankingTextColorBox(title: '승률'),
                        ]),
                        Row(children: [
                          RankingTextClearBox(title: list[index].winCount),
                          RankingTextClearBox(title: list[index].loseCount),
                          RankingTextClearBox(
                              title: list[index].goalDifference),
                          RankingTextClearBox(title: list[index].winningRate),
                        ]),
                        Row(
                          children: const [
                            RankingTextColorBox(title: 'KDA'),
                            RankingTextColorBox(title: '킬'),
                            RankingTextColorBox(title: '데스'),
                            RankingTextColorBox(title: '어시'),
                          ],
                        ),
                        Row(
                          children: [
                            RankingTextClearBox(title: list[index].kdaScore),
                            RankingTextClearBox(title: list[index].killCount),
                            RankingTextClearBox(title: list[index].deathCount),
                            RankingTextClearBox(title: list[index].assistCount),
                          ],
                        )
                      ],
                    ),
                  ),
                ])),
      ]),
    );
  }
}

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/ranking/team_ranking_card_widget.dart';
import 'package:lol_esports_korea_app/components/ranking/team_ranking_data.dart';

import '../../api/ranking/ranking_info_api.dart';

bool load = false;
List<String> dropdownList = ['2022 LCK 스프링', '2022 LCK 서머'];
String selectedDropdown = '2022 LCK 스프링';
List<TeamRankingData> rankingList = [];

class TeamRankingForm extends StatefulWidget {
  const TeamRankingForm({Key? key}) : super(key: key);

  @override
  State<TeamRankingForm> createState() => _TeamRankingFormState();
}

class _TeamRankingFormState extends State<TeamRankingForm> {
  @override
  void initState() {
    super.initState();
    addTeamRankingInfo(selectedDropdown);
  }

  Future addTeamRankingInfo(String request) async {
    await RankingApi.getTeamRankingInfo(request).then((rankingInfoList) {
      rankingList.clear();
      for (var i = 0; i < rankingInfoList.length; i++) {
        rankingList.add(TeamRankingData(
            seasonTitle: rankingInfoList[i].seasonTitle,
            ranking: rankingInfoList[i].ranking,
            teamName: rankingInfoList[i].teamName,
            winCount: rankingInfoList[i].winCount,
            loseCount: rankingInfoList[i].loseCount,
            goalDifference: rankingInfoList[i].goalDifference,
            winningRate: rankingInfoList[i].winningRate,
            kdaScore: rankingInfoList[i].kdaScore,
            killCount: rankingInfoList[i].killCount,
            deathCount: rankingInfoList[i].deathCount,
            assistCount: rankingInfoList[i].assistCount));
      }
      debugPrint("rankingList : " + rankingList[0].teamName);
      setState(() {
        load = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (load == false) {
      return const Padding(
        padding: EdgeInsets.all(100),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(children: <Widget>[
          DropdownButton(
            value: selectedDropdown,
            items: dropdownList.map((String item) {
              return DropdownMenuItem<String>(
                child: Text(
                  '$item',
                  style: const TextStyle(fontSize: 20),
                ),
                value: item,
              );
            }).toList(),
            borderRadius: BorderRadius.circular(10),
            onChanged: (dynamic value) {
              setState(() {
                selectedDropdown = value;
              });
              addTeamRankingInfo(selectedDropdown);
            },
          ),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 0,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 1,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 2,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 3,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 4,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 5,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 6,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 7,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 8,
                ),
                TeamTankingCardWidget(
                  list: rankingList,
                  index: 9,
                ),
              ],
            ),
          )
        ]),
      ); // }
    }
  }
}

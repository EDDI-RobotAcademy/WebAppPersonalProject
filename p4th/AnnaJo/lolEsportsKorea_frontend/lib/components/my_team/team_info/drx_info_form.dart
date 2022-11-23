import 'package:flutter/cupertino.dart';

import 'info_card_widget.dart';

class DrxInfoForm extends StatelessWidget {
  const DrxInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        InfoCardWidget(
            teamName: 'DRX',
            position: 'bottom',
            rosterNiCkName: 'DEFT',
            rosterName: 'HYEOKGYU KIM',
            profilePic: 'deft'),
        InfoCardWidget(
            teamName: 'DRX',
            position: 'mid',
            rosterNiCkName: 'JEKA',
            rosterName: 'GEONWOO KIM',
            profilePic: 'jeka'),
        InfoCardWidget(
            teamName: 'DRX',
            position: 'jungle',
            rosterNiCkName: 'PYOSIK',
            rosterName: 'CHANGHYEON HONG',
            profilePic: 'pyosik'),
        InfoCardWidget(
            teamName: 'DRX',
            position: 'top',
            rosterNiCkName: 'KINGEN',
            rosterName: 'SUNGHOON HWANG',
            profilePic: 'kingen'),
        InfoCardWidget(
            teamName: 'DRX',
            position: 'utility',
            rosterNiCkName: 'BERYL',
            rosterName: 'GEONHEE JO',
            profilePic: 'beryl'),
        InfoCardWidget(
            teamName: 'DRX',
            position: 'bottom',
            rosterNiCkName: 'TAEYOON',
            rosterName: 'TAEYUN KIM',
            profilePic: 'taeyoon')
      ],
    );
  }
}

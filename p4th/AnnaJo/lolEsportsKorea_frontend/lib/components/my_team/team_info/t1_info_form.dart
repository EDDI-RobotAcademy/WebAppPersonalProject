import 'package:flutter/material.dart';

import 'info_card_widget.dart';

class T1InfoForm extends StatelessWidget {
  const T1InfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        InfoCardWidget(
            teamName: 'T1',
            position: 'mid',
            rosterNiCkName: 'FAKER',
            rosterName: 'SANGHYEOK LEE',
            profilePic: 'faker'),
        InfoCardWidget(
            teamName: 'T1',
            position: 'jungle',
            rosterNiCkName: 'ONER',
            rosterName: 'SANGHYEOK LEE',
            profilePic: 'oner'),
        InfoCardWidget(
            teamName: 'T1',
            position: 'bottom',
            rosterNiCkName: 'GUMAYUSI',
            rosterName: 'SMINHYUNG LEE',
            profilePic: 'gumayusi'),
        InfoCardWidget(
            teamName: 'T1',
            position: 'utility',
            rosterNiCkName: 'KERIA',
            rosterName: 'MINSEOK RYU',
            profilePic: 'keria'),
        InfoCardWidget(
            teamName: 'T1',
            position: 'top',
            rosterNiCkName: 'ZEUS',
            rosterName: 'WOOJE CHOI',
            profilePic: 'zeus'),
        InfoCardWidget(
            teamName: 'T1',
            position: 'utility',
            rosterNiCkName: 'ASPER',
            rosterName: 'TAEKI KIM',
            profilePic: 'asper')
      ],
    );
  }
}

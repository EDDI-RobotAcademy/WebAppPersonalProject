import 'package:flutter/material.dart';

import '../../../components/app_bar/common_top_app_bar.dart';
import '../../../components/my_team/team_info/drx_info_form.dart';
import '../../../components/my_team/team_middle_bar.dart';
import '../../../components/my_team/team_top_title_widget.dart';
import '../../../utility/size.dart';
import '../temas_comment_page/drx_comment_fage.dart';

class DrxPage extends StatefulWidget {
  const DrxPage({Key? key}) : super(key: key);

  @override
  State<DrxPage> createState() => _DrxPageState();
}

class _DrxPageState extends State<DrxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonTopAppBar(
          title: const Text('DRX'),
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TeamTopTitleWidget(teamName: 'DRX', logoName: 'DRX'),
              Container(
                color: Colors.black,
                height: 30,
                child: Row(
                  children: [
                    TeamMiddleBar(
                        title: 'INFO',
                        onCustomButtonPressed: () {
                          null;
                        }),
                    const SizedBox(width: medium_gap),
                    TeamMiddleBar(
                        title: 'Comment',
                        onCustomButtonPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DRXCommentTestPage()));
                        }),
                  ],
                ),
              ),
              ListView(shrinkWrap: true, children: const [
                DrxInfoForm(),
              ])
            ],
          ),
        ));
  }
}

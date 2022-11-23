import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/utility/size.dart';

import '../../../components/app_bar/common_top_app_bar.dart';
import '../../../components/my_team/team_info/t1_info_form.dart';
import '../../../components/my_team/team_middle_bar.dart';
import '../../../components/my_team/team_top_title_widget.dart';
import '../temas_comment_page/t1_comment_fage.dart';

class T1Page extends StatefulWidget {
  const T1Page({Key? key}) : super(key: key);

  @override
  State<T1Page> createState() => _T1PageState();
}

class _T1PageState extends State<T1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonTopAppBar(
          title: const Text('T1'),
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TeamTopTitleWidget(
                teamName: 'T1',
                logoName: 'T1',
              ),
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
                                      const T1CommentTestPage()));
                        }),
                  ],
                ),
              ),
              ListView(shrinkWrap: true, children: const [
                T1InfoForm(),
              ])
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:leaing_helper/components/app_bar/common_app_bar.dart';

import '../../api/learning_api/spring_words_learning_api.dart';
import '../../components/app_bar/common_appbar_drawer.dart';
import '../../utility/decorations/buttonStyle.dart';
import '../../utility/decorations/text_style.dart';

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({Key? key}) : super(key: key);

  gotoWordsStudy(BuildContext context) async {
    Navigator.pushNamed(context, "/select_words_degree_page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar( appBar: AppBar()),
      drawer: const CommonAppbarDrawer(),
      resizeToAvoidBottomInset: false,
      body : Container(
        padding: const EdgeInsets.only(top: 80, left: 25),
        child: Column(
           children: [
             const SizedBox(
             height: 100,
             width: double.infinity,
             child: Text("학습 하고자 하는 과목을 선택하세요" ,style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),),
             TextButton(
                style: elevatedButtonStyle(200 , 80),
                onPressed: () {
                  gotoWordsStudy(context);
                  },
                child: Text("Lets study Words" ,
                  style: defaultBtnTextStyle(),
              )
            )
          ],
        ),
      ),
    );
  }
}

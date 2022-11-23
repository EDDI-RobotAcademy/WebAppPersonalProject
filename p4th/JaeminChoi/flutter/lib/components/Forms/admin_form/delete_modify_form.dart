import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

import '../../../api/info/word-learning-info.dart';
import '../../../api/learning_api/spring_words_learning_api.dart';
import '../../../pages/admin_pages/input_modify_page.dart';
import '../../../pages/admin_pages/learning_register_page.dart';

class DeleteModifyForm extends StatefulWidget{
  const DeleteModifyForm({Key?key}) : super (key: key);

  @override
  State<DeleteModifyForm> createState() => _DeleteModifyForm();
}

class _DeleteModifyForm extends State<DeleteModifyForm>{


  late List<dynamic> wordsinfo;

  @override
  void initState() {
    super.initState();
    wordsinfo = SpringWordLearningApi.wordlistState;
    debugPrint("wordsinfo" + wordsinfo[0].toString());
  }

  @override
  void dispose() {
    super.dispose();
    wordsinfo.clear();
  }

  void sendModifyItems(index){
    List<dynamic> items = [
      wordsinfo[index]['word'],
      wordsinfo[index]['meaning'],
      wordsinfo[index]['synonym'],
      wordsinfo[index]['antonym'],
      wordsinfo[index]['example'],
      wordsinfo[index]['wordId']
    ];

    Navigator.push(context, MaterialPageRoute(builder: (context) => InputModifyPage(itemsList: items)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 50,),
        Row(
          children: const [
            SizedBox(width: 50,),
            SizedBox(child: Text("word",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),width: 135,),
            Text("meaning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
          ],
        ),
        Form(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: ListView.builder(
                scrollDirection: Axis.vertical ,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount : (wordsinfo.isEmpty) ? 1 : wordsinfo.length,
                itemBuilder: (context, index){
                  return SizedBox(
                      height: (wordsinfo.isEmpty) ? 300 : 60,
                      width: double.infinity,
                      child: (wordsinfo.isEmpty) ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 80,),
                          const SizedBox(
                              width: 200,
                              child: Text("해당 차수엔",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          const SizedBox(
                              width: 200,
                              child: Text("어떤 단어도 없습니다",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          const SizedBox(
                              width: 200,
                              child: Text("학생들을 위해",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          const SizedBox(
                              width: 200,
                              child: Text("단어를 추가 해주세요!",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          const SizedBox(height: 15,),
                          TextButton(
                            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LearningRegisterPage() )); },
                            child: const Text("단어 등록하러 가기"),)
                        ],
                      ):
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 140,
                              child: Text(wordsinfo[index]['word'],style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          SizedBox(
                              width: 140,
                              child: Text(wordsinfo[index]['meaning'],style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          SizedBox(width: 15,),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(ColorStyle.defaultButton),
                                  fixedSize: MaterialStateProperty.all(Size(50, 15))),
                              onPressed: (){
                                sendModifyItems(index);
                              }, child: const Text("수정")),
                          SizedBox(width: 15,),
                        ],
                      )
                  );
                }
            ),
          ),
        ),
      ],
    );
  }

}
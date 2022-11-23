import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../api/info/word-learning-info.dart';
import '../../../api/learning_api/spring_words_learning_api.dart';

class SelectDegreeForm extends StatefulWidget{
  const SelectDegreeForm({Key? key , required this.UseedPosition}) :super (key: key);

  final int UseedPosition;
  @override
  State<SelectDegreeForm> createState() => _SelectDegreeForm();
}
class _SelectDegreeForm extends State<SelectDegreeForm>{

  List<int> _Degree = [1,2,3,4,5,6,7,8,9,10,11,12];

  void setWordListForModify(index)async{
    await SpringWordLearningApi().getWordsList(index+1);
    Navigator.pushNamed(context, "/delete_modify_page");
  }

  void setWordListForLearning(index)async{
    await SpringWordLearningApi().getWordsList(index+1);
    Navigator.pushNamed(context, "/words_learning_page");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: ListView.builder(
            scrollDirection: Axis.vertical ,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _Degree.length,
            itemBuilder: (context, index){
              return Container(
                height: 70,
                alignment: Alignment.center,
                child: widget.UseedPosition ==0  ?
                TextButton(
                  onPressed: (){
                    setWordListForModify(index);
                  },
                  child: Text('${index+1} 차시'),
                ) :
                TextButton(
                  onPressed: (){
                    setWordListForLearning(index);
                  },
                  child: Text('${index+1} 차시'),
                ) ,
              );
            }
         ),
      ),
    );
  }
}
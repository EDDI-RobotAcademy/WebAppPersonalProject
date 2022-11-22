import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

import '../../../api/info/word_register_info.dart';
import '../../../api/learning_api/spring_words_learning_api.dart';
import '../../../api/state/learning_validate.dart';
import '../../../utility/alert/commonSnackBar.dart';
import '../../text_form_filed/admin_text_form.dart';

class LearningRegisterForm extends StatefulWidget{
  const LearningRegisterForm({Key? key}) :super (key:key);

  @override
  State<LearningRegisterForm> createState() => _LearningRegisterForm();
}

class _LearningRegisterForm extends State<LearningRegisterForm>{
  late TextEditingController wordController;
  late TextEditingController meaningController;
  late TextEditingController synonymController;
  late TextEditingController antonymController;
  late TextEditingController exampleController;

  List<int> _Degree = [1,2,3,4,5,6,7,8,9,10,11,12];
  int _selected = 1;

  void initState() {
    super.initState();
    wordController = TextEditingController();
    meaningController = TextEditingController();
    synonymController = TextEditingController();
    antonymController = TextEditingController();
    exampleController = TextEditingController();
  }

  @override
  void dispose() {
    wordController.dispose();
    meaningController.dispose();
    synonymController.dispose();
    antonymController.dispose();
    exampleController.dispose();
    super.dispose();
  }

  registerWordItem() async{
    WordRegisterInfo wordItem = WordRegisterInfo(
        wordController.text,
        meaningController.text,
        synonymController.text,
        antonymController.text,
        exampleController.text,
        _selected,
    );
    await SpringWordLearningApi().registerWordList(wordItem);
    if(LearningValidate.isWordItemRegister == true){
      wordController.clear();
      meaningController.clear();
      synonymController.clear();
      antonymController.clear();
      exampleController.clear();
      debugPrint("등록 완료");
      ScaffoldMessenger.of(context).showSnackBar(
          CommonSnackBar.registerWordSnackBar());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(left: 45),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(top: 100, bottom: 50),
                child : Column(
                  children: [
                    Text("사용자가 학습 해야 할", style: TextStyle(fontSize: 20),),
                    Text("단어를 입력 해주세요", style: TextStyle(fontSize: 20),),
                  ],
                )),
            AdminTextForm( controller: wordController, hintText: 'Words', smallTitle: '단어',),
            SizedBox(height: 25,),
            AdminTextForm( controller: meaningController, hintText: 'Meaning', smallTitle: '의미',),
            SizedBox(height: 25,),
            AdminTextForm( controller: synonymController, hintText: 'synonym', smallTitle: '동의어',),
            SizedBox(height: 25,),
            AdminTextForm( controller: antonymController, hintText: 'antonym', smallTitle: '반의어',),
            SizedBox(height: 25,),
            AdminTextForm( controller: exampleController, hintText: 'example', smallTitle: '예시',),
            SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      value: _selected,
                      items: _Degree.map(
                            (value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Text(value.toString() + "차시")
                          );
                        },
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selected = value as int;
                        });
                      }
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                registerWordItem();
              },
              child: Text("새로운 단어 등록"),
            )
          ],
        ),
      ),
    );
  }

}
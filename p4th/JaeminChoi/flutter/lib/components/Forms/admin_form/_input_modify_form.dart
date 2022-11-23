import 'package:flutter/material.dart';

import '../../../api/info/word_modify_info.dart';
import '../../../api/learning_api/spring_words_learning_api.dart';
import '../../../api/state/learning_validate.dart';
import '../../text_form_filed/modifyTextForm.dart';

class InputModifyForm extends StatefulWidget{
  const InputModifyForm({Key?key, required this.itemsList}) :super (key: key);

  final List<dynamic> itemsList;
  @override
  State<InputModifyForm> createState() => _InputModifyForm();
}

class _InputModifyForm extends State<InputModifyForm>{

  late TextEditingController wordController;
  late TextEditingController meaningController;
  late TextEditingController synonymController;
  late TextEditingController antonymController;
  late TextEditingController exampleController;
  final word    =0;
  final meaning =1;
  final synonym =2;
  final antonym =3;
  final example =4;
  final wordId  =5;

  @override
  void initState() {
    super.initState();
    wordController = TextEditingController(text: widget.itemsList[word]);
    meaningController = TextEditingController(text: widget.itemsList[meaning]);
    synonymController = TextEditingController(text: widget.itemsList[synonym]);
    antonymController = TextEditingController(text: widget.itemsList[antonym]);
    exampleController = TextEditingController(text: widget.itemsList[example]);
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

  void sendModifyItem() async{
    WordModifyInfo wordItem = WordModifyInfo(
      widget.itemsList[wordId],
      wordController.text,
      meaningController.text,
      synonymController.text,
      antonymController.text,
      exampleController.text,
    );
    await SpringWordLearningApi().modifyWordItems(wordItem);

    if(LearningValidate.isWordItemModify == true){
      wordController.clear();
      meaningController.clear();
      synonymController.clear();
      antonymController.clear();
      exampleController.clear();
      LearningValidate.isWordItemModify = false;
      debugPrint("수정 완료");
    }
  }

  void deleteItem() async{
    await SpringWordLearningApi().deleteWordItem(widget.itemsList[wordId]);

    if(LearningValidate.isWordItemDelete == true){
      debugPrint("삭제 완료");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: Column(
          children: [
            Text("수정 하고자 하는 값을 입력 해주세요",style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            ModifyTextForm(controller: wordController, smallTitle: '단어',),
            ModifyTextForm(controller: meaningController, smallTitle: '의미',),
            ModifyTextForm(controller: synonymController, smallTitle: '동의어',),
            ModifyTextForm(controller: antonymController, smallTitle: '반의어',),
            ModifyTextForm(controller: exampleController, smallTitle: '예시',),
            TextButton(onPressed: (){sendModifyItem();}, child: Text("수정")),
            SizedBox(height: 20,),
            TextButton(onPressed: (){deleteItem();}, child: Text("삭제")),
          ],
        ),
      ),
    );
  }
}

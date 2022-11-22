import 'package:flutter/material.dart';

import '../../../api/learning_api/spring_words_learning_api.dart';
import '../../../components/Forms/admin_form/select_degree_form.dart';
import '../../../utility/alert/commonSnackBar.dart';

class SelectWordsDegreePage extends StatefulWidget {
  const SelectWordsDegreePage({Key ? key}) : super (key: key);
  @override
  State<SelectWordsDegreePage> createState() => _SelectWordsDegreePage();
}

class _SelectWordsDegreePage extends State<SelectWordsDegreePage> {


  final List<double> degree =[1,2,3,4,5,6,7,8,9,10,11,12];
  final int usedForLearningPosition = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SelectDegreeForm(UseedPosition: usedForLearningPosition,)
            ],
          )
        ),
      ),
    );
  }
}


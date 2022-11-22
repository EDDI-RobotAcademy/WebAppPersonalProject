import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../api/info/word-learning-info.dart';
import '../../../api/learning_api/spring_words_learning_api.dart';
import '../../../components/Forms/personal_form/word_learning_form.dart';

class WordsLearningPage extends StatefulWidget {
  const WordsLearningPage({Key? key}) : super (key: key);

  @override
  State<WordsLearningPage> createState() => _WordsLearningPage();
}

class _WordsLearningPage extends State<WordsLearningPage>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: const SafeArea(
            child: WordLearningForm(),
          ),
        ),
    );
  }



}
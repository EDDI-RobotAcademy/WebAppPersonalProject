import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:leaing_helper/api/info/word_register_info.dart';

import '../info/word_modify_info.dart';
import '../state/learning_validate.dart';

class SpringWordLearningApi {
  static const String httpUri = '192.168.0.8:7776';
  static var wordlistState;

  createDegree (int Degree) async {
    var data = {'Degree' : Degree};
    var body = json.encode(data);

    debugPrint("createDegree() 실행");

    try{
      var result = await http.post(
        Uri.http(httpUri, '/learning/create-degree'),
        headers: {"Content-Type" : "application/json"},
        body: body,
      );

      if(result.statusCode == 200){
        var decodeResult = jsonDecode(result.body);
        debugPrint("result : " + decodeResult);
      }
    }
    catch(error){
      debugPrint("error : " + error.toString());
    }
  }

  getWordsList (int degree) async{
    var data = {'degree' : degree};
    var body = json.encode(data);

    debugPrint("getWordsList() 실행");
    try{
      var result = await http.post(
        Uri.http(httpUri, '/learning/get-wordsList/$degree'),
        headers: {"Content-Type" : "application/json"},
        body: body,
      );
      if(result.statusCode == 200){
        debugPrint("wordsList.body = " + result.toString());
        wordlistState = jsonDecode(utf8.decode(result.bodyBytes));
      }
    }catch(error){
      debugPrint("error : " + error.toString());
    }
  }

  registerWordList(WordRegisterInfo wordRegisterInfo ) async {
    var data = { 'word': wordRegisterInfo.word,
      'meaning': wordRegisterInfo.meaning,
      'synonym': wordRegisterInfo.synonym,
      'antonym': wordRegisterInfo.antonym,
      'example': wordRegisterInfo.example,
      'degree': wordRegisterInfo.degree,
    };

    var body = json.encode(data);
    debugPrint("body : " + body);

    debugPrint("registerWordList() 실행");

    try{
      var result = await http.post(
        Uri.http(httpUri, '/learning/words-register'),
        headers: {"Content-Type" : "application/json"},
        body: body,
      );
      if(result.statusCode == 200){
        debugPrint("wordsList.body = " + result.toString());
        var resultState = jsonDecode(result.body);
        if( resultState ==true ){
          LearningValidate.isWordItemRegister = true;
        }
      }
    }catch(error){
      debugPrint("error : " + error.toString());
    }
  }

  modifyWordItems(WordModifyInfo wordModifyInfo) async {
    var data = { 'word': wordModifyInfo.word,
      'meaning': wordModifyInfo.meaning,
      'synonym': wordModifyInfo.synonym,
      'antonym': wordModifyInfo.antonym,
      'example': wordModifyInfo.example,
      'wordId' : wordModifyInfo.wordId
    };

    var body = json.encode(data);
    debugPrint("body : " + body);

    debugPrint("modifyWordItems() 실행");

    try{
      var result = await http.post(
        Uri.http(httpUri, '/learning/words-modify'),
        headers: {"Content-Type" : "application/json"},
        body: body,
      );
      if(result.statusCode == 200){
        if(jsonDecode(result.body) == true ){
          LearningValidate.isWordItemModify = true;
        }
      }
    }catch(error){
      debugPrint("error : " + error.toString());
    }
  }

  deleteWordItem(int wordId) async {
    var data = { 'word': wordId,};

    var body = json.encode(data);
    debugPrint("body : " + body);

    debugPrint("modifyWordItems() 실행");

    try{
      var result = await http.post(
        Uri.http(httpUri, '/learning/words-delete/$wordId'),
        headers: {"Content-Type" : "application/json"},
        body: body,
      );
      if(result.statusCode == 200){
        if(jsonDecode(result.body) == true ){
          LearningValidate.isWordItemDelete = true;
        }
      }
    }catch(error){
      debugPrint("error : " + error.toString());
    }
  }
}
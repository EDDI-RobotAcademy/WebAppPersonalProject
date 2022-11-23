import 'package:flutter/material.dart';

import '../../../api/learning_api/spring_words_learning_api.dart';

class WordLearningForm extends StatefulWidget{
  const WordLearningForm({Key?key}) : super (key: key);

  @override
  State<WordLearningForm> createState() => _WordLearningForm();
}

class _WordLearningForm extends State<WordLearningForm>{

  late List<dynamic> wordsinfo;

  List<bool> isVisible = List.generate(
      SpringWordLearningApi.wordlistState.length,
          (index) => true);

  @override
  void initState() {
    super.initState();
    wordsinfo = SpringWordLearningApi.wordlistState;
  }
  @override
  void dispose() {
    super.dispose();
    wordsinfo.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          height: 500,
          width: 450,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount : (wordsinfo.isEmpty) ? 1:wordsinfo.length,
              itemBuilder: (context, index){
                return (wordsinfo.isEmpty) ?
                Container(
                  padding: EdgeInsets.only(top: 300 ,left: 40 ),
                  child: Column(
                    children: const [
                      Text("이런!",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 5,),
                      Text("해당 차수엔 아직 아무런 단어가 없나봐요!",style: TextStyle(fontSize: 15)),
                      SizedBox(height: 5,),
                      Text("열심히 단어 정리후 학습 할 수 있도록 올려드릴게요!",style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ):
                Container(
                  padding: EdgeInsets.only(top: 20 , left: 30),
                  height: 500,
                  width: 350,
                  child: Column(
                    children: [
                      Card(
                        color: Colors.black,
                        child: InkWell(
                          child: Column(
                            children: [
                              SizedBox(height: 50,),
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("단어 : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  Text(wordsinfo[index]['word'],style: TextStyle(color: Colors.white,fontSize: 15)),
                                ],
                              ),
                              SizedBox(height: 40,),
                              SizedBox(
                                child: Visibility(
                                  visible: isVisible[index],
                                  child: Row(
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("의미 : ",style: TextStyle(color: Colors.white,fontSize: 15)),
                                      Text(wordsinfo[index]['meaning'],style: TextStyle(color: Colors.white,fontSize: 15)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 40,),
                            ],
                          ),
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: (){
                            if(isVisible[index]){
                              setState(() {
                                isVisible[index] = !isVisible[index];
                              });
                            }else{
                              setState(() {
                                isVisible[index] = !isVisible[index];
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Card(
                        color: Colors.black,
                        child: Container(
                          padding: EdgeInsets.only(top: 13 , bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("동의어 : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  Text(wordsinfo[index]['synonym'],style: TextStyle(color: Colors.white,fontSize: 15)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Card(
                        color: Colors.black,
                        child: Container(
                          padding: EdgeInsets.only(top: 13 , bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("반의어 : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  Text(wordsinfo[index]['antonym'],style: TextStyle(color: Colors.white,fontSize: 15)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Card(
                        color: Colors.black,
                        child: Container(
                          padding: EdgeInsets.only(top: 13 , bottom: 10),
                          child: Column(
                            children: [
                              Text("예시",style: TextStyle(color: Colors.white,fontSize: 15),),
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        strutStyle: StrutStyle(fontSize: 16.0),
                                        text:TextSpan(text: wordsinfo[index]['example'],style: TextStyle(color: Colors.white,fontSize: 15))
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                );
              }
          ),
        ),
    );
  }


}
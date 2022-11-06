import 'package:flutter/material.dart';

import 'package:slide_to_push_frontend/utility/color.dart';
import '../components/todos_list.dart';
import '../utility/size.dart';

class MyTodoView extends StatelessWidget {
  const MyTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:Container(
        margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child: FloatingActionButton(
            child: Icon(
              Icons.edit,
            ),
            backgroundColor: ColorPicker.defaultBlack,
            onPressed: (){},
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('방문자님 환영합니다.', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: Border(
            top: BorderSide(
                color: ColorPicker.defaultBlack,
                width: 5
            ),
            left: BorderSide(
                color: ColorPicker.defaultBlack,
                width: 5
            ),
            right: BorderSide(
                color: ColorPicker.defaultBlack,
                width: 5
            )
        ),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                  vertical: BorderSide(color: ColorPicker.defaultBlack, width: 5)
              ),
              // color: Colors.red,
            ),
            child: Column(
              children: [
                SizedBox(height: medium_gap,),
                Text("내 응원개 수"),
                SizedBox(height: medium_gap,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  child:Text("TODAY", style: TextStyle(color: Colors.white),), color: ColorPicker.defaultBlack,),
                TodosList(),
                SizedBox(height: 2.5, child: Container(color: ColorPicker.defaultBlack),),
                TextButton(
                  onPressed: (){  },
                  child: Text('클릭해서 통신확인', style:TextStyle(color: ColorPicker.subTextButton, fontSize: 18)),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}

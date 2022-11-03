import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:slide_to_push_frontend/utility/color.dart';

import '../components/todos_list.dart';
import '../utility/size.dart';

class TodosMainView extends StatelessWidget {
  const TodosMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App화면', style: TextStyle(color: Colors.black),),
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
              Text("방문자님 반갑습니다."),
              SizedBox(height: medium_gap,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                child:Text("TODAY", style: TextStyle(color: Colors.white),), color: ColorPicker.defaultBlack,),
              TodosList(),
              SizedBox(height: 2.5, child: Container(color: ColorPicker.defaultBlack),)
            ],
          ),
        )
      )
    );
  }
}

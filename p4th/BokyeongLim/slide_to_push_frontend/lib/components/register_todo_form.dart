
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_push_frontend/api/http_service_api.dart';
import 'package:slide_to_push_frontend/components/date_picker_controller.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_common.dart';
import 'package:slide_to_push_frontend/utility/size.dart';

import '../utility/buttons.dart';
import '../utility/color.dart';

class RegisterTodoForm extends StatefulWidget {
  const RegisterTodoForm({Key? key}) : super(key: key);
  @override
  State<RegisterTodoForm> createState() => _RegisterTodoFormState();
}

class _RegisterTodoFormState extends State<RegisterTodoForm> {
  late TextEditingController todosController;

  @override
  void initState() {
    super.initState();
    todosController = TextEditingController();
  }
  @override
  void dispose() {
    todosController.dispose();
    super.dispose();
  }

  saveRegisterTodoInfo() async{
    await HttpService().requestRegisterTodos(
        todosController.text,
        DateFormat('yyyy-MM-dd')
            .format(Get.find<DatePickerController>()
            .selectedDate.value)
            .toString()
    );

    if(HttpService.resRegisterTodos.statusCode == 200) {
      debugPrint("등록됨");
      todosController.clear();
    }else {
      todosController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Get.put(DatePickerController());
    return Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                    DateFormat('yyyy-MM-dd')
                        .format(Get.find<DatePickerController>()
                        .selectedDate.value)
                        .toString(),
                    style: TextStyle(fontSize: 20)
                )),
                SizedBox(width: small_gap,),
                TextButton(
                  onPressed: () => Get.find<DatePickerController>().chooseDate(context),
                  child: Text('날짜 선택',
                    style: TextStyle(
                      fontFamily: 'AppleSDGothicNeoB',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width, height:4.0, child: Container(color: ColorPicker.defaultBlack),),
            SizedBox(height: medium_gap,),
            TextFieldCommon(controller: todosController, formName: '할 일'),
            SizedBox(height: medium_gap,),
            ElevatedButton(
              onPressed:(){
                saveRegisterTodoInfo();
                formKey.currentState?.save();
              },
              child:Text("등록", style: TextStyle(color: Colors.white,)),
              style: Buttons.defaultButton,
            ),
            SizedBox(height: medium_gap),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Back', style:TextStyle(color: ColorPicker.subTextButton, fontSize: 18)),
              style: Buttons.defaultTextButton,
            )
          ],
        ),
    );
  }
}

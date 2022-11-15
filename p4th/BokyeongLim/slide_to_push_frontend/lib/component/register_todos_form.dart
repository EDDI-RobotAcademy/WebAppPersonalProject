import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/component/custom_date_picker.dart';
import '/controller/sign_in_controller.dart';
import '/controller/todo_list_controller.dart';
import '/view/my_main_view.dart';
import '/controller/date_picker_controller.dart';
import 'custom_todos_input.dart';

class RegisterTodosForm extends StatefulWidget {
  const RegisterTodosForm({Key? key}) : super(key: key);
  @override
  State<RegisterTodosForm> createState() => _RegisterTodosFormState();
}

class _RegisterTodosFormState extends State<RegisterTodosForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ListController listController = Get.find();
  SignInController signInController = Get.find();

  late TextEditingController todosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTodosInput(controller: todosController),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
            child: CustomDatePicker(),
          ),

          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 54,
              child: ElevatedButton(
                onPressed:() async{
                  if(todosController.text.isNotEmpty) {
                    formKey.currentState?.save();

                    bool result = await listController.save(
                        todosController.text,
                        DateFormat('yyyy-MM-dd')
                            .format(Get.find<DatePickerController>()
                            .selectedDate.value)
                            .toString()
                    );

                    if (result) {
                      Get.snackbar(
                        'SUCCESS',
                        '등록에 성공하였습니다.',
                        backgroundColor: Colors.white,
                      );

                      listController.fetchData();
                      Get.off(() => MyMainView());
                    } else {
                      Get.snackbar(
                        'FAILED',
                        '토큰 만료로 등록에 실패하였습니다.',
                        backgroundColor: Colors.white,
                      );
                    }



                  }
                },
                child:Text("등록", style: TextStyle(color: Colors.white,)),
              ),
          ),
          SizedBox(height: 10),
          TextButton(onPressed: (){Get.off(() => MyMainView());}, child: Text('back'))
        ],
      ),
    );
  }
}

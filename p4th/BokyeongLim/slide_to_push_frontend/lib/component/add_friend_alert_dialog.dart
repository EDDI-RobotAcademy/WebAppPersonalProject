import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/component/custom_email_input.dart';
import 'package:my_todos/controller/friend_controller.dart';

class AddFriendPopup extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  FriendController friendController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('친구 추가'),
      content: CustomEmailInput(controller: controller),

      insetPadding: EdgeInsets.fromLTRB(10, 6, 10, 6),
      actions:<Widget>[
        TextButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Text('취소')),
        TextButton(
            child: Text('추가'),
            onPressed: () async{
              bool result = await friendController.add(controller.text);

              if(result) {
                friendController.fetchData();
                Navigator.of(context).pop();

              } else {
                Get.snackbar(
                  'FAILED',
                  '친구 정보를 다시 한번 확인해주세요.',
                  backgroundColor: Colors.white,
                );
              }
            },
        ),
      ],
    );
  }
}

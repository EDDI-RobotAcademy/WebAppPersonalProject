import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/controller/todo_list_controller.dart';

import '../controller/sign_in_controller.dart';
import 'custom_list_tile.dart';

//ignore: must_be_immutable
class MyTodoList extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  ListController listController = Get.put(ListController());
  SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context){
    print("build");
    return  Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child: Obx(
                    () => RefreshIndicator(
                          key: refreshKey,
                          onRefresh: () async {
                              await listController.fetchData();
                          },
                          child: ListView.builder(
                              itemCount: listController.todosList.length,
                              itemBuilder: (context, index){
                                return CustomListTile(listController.todosList[index]);
                              }
                          ))
                    ),
            );
  }
}

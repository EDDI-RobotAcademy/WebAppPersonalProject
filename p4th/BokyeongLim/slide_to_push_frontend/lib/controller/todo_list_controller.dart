import 'package:get/get.dart';
import 'package:my_todos/controller/sign_in_controller.dart';
import 'package:my_todos/utility/api/todos_service_api.dart';
import '../model/todos.dart';
import '../utility/states/authentication.dart';

class ListController extends GetxController{
  SignInController signInController = Get.find();
  var todosList = <Todos>[].obs;

  @override
  void onInit() {
    super.onInit();

    if(signInController.isAuthenticated.value) {
      fetchData();
    } else {
      print("로그인오류");
    }
  }

  Future<void> fetchData() async{
    var todos = await TodosService.fetchTodos();
    if(todos != null) {
      todosList.value = todos;
    }
  }
  save(String content, String date) async {
    if(signInController.isAuthenticated.value) {
      await TodosService.requestRegisterTodos(content, date);
    }

    if(TodosService.reqRegisterTodos.statusCode != 200) {
      return false;
    }

    return true;
  }
  delete(dynamic boardNo) async{
    if(signInController.isAuthenticated.value) {
      await TodosService.requestDeleteFromSpring(boardNo);
    }

    if(TodosService.reqDelete.statusCode != 200) {
      return false;
    }

    return true;

  }
  void toggle(int boardNo) async{
    TodosService.requestChangeTodosStatusFromSpring(boardNo);
  }

}

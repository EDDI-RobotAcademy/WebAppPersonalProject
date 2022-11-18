import 'package:get/get.dart';
import 'package:my_todos/controller/sign_in_controller.dart';
import 'package:my_todos/utility/api/friend_service_api.dart';

import '../model/friend.dart';

class FriendController extends GetxController {
  SignInController signInController = Get.find();
  var friendsList = <Friend>[].obs;

  @override
  void onInit() {
    super.onInit();

    if(signInController.isAuthenticated.value) {
      fetchData();
    } else {
      print("로그아웃 상태");
    }
  }
  Future<void> fetchData() async{
    var friend = await FriendService.fetchFriends();
    if(friend != null) {
      friendsList.value = friend;
    }
  }
}
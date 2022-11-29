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
  delete(String friendEmail) async {
    if(signInController.isAuthenticated.value) {
      await FriendService.requestDeleteFriend(friendEmail);
    }

    if(FriendService.reqDeleteFriend.statusCode != 200) {
      return false;
    }

    return true;
  }

  add(String friendEmail) async {

    bool? result;
    if (signInController.isAuthenticated.value) {
      result = await FriendService.requestAddFriend(friendEmail);
      print("controller로 리턴된 값 : " + result.toString());
    }

    return result;
  }
}
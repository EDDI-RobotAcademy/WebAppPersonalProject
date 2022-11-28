import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/component/add_friend_alert_dialog.dart';

import '../controller/friend_controller.dart';
import '../utility/style/common_text_style.dart';

class FriendsDrawer extends StatelessWidget {
  FriendController friendController = Get.put(FriendController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog() async {
      return showDialog<void> (
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AddFriendPopup();
          }
      );
    }
    return Drawer(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Friends", style: subHeaderText()),
                IconButton(
                    icon: Icon(Icons.person_search, color: Colors.black87,),
                    onPressed: (){_showMyDialog();},
                )
              ],
            ),
          ),

          Container(

              child:Expanded(
                  child: Obx(
                      ()=> RefreshIndicator(
                          key: refreshKey,
                          onRefresh: () async {
                            await friendController.fetchData();
                          },
                          child : ListView.builder(
                            itemCount: friendController.friendsList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                  children: [
                                    ListTile(
                                        title: Row(
                                          children: [
                                            Icon(Icons.person, color: Colors.blueAccent, size: 20),
                                            SizedBox(width: 8,),
                                            Text(friendController.friendsList[index].friendEmail, style: subText())
                                          ],
                                        ),
                                        trailing : TextButton(
                                          child: Text('삭제', style: TextStyle(fontSize: 10),),
                                          onPressed: () async{
                                            bool result =  await friendController.delete
                                              (friendController.friendsList[index].friendEmail);

                                            if(result) {
                                              friendController.fetchData();
                                            } else {
                                              print("통신 오류");
                                            }

                                            },
                                        )
                                    ),
                                    SizedBox( width: MediaQuery.of(context).size.width, child: Container(height: 1, color: Colors.black12,),)
                                  ]
                              );
                            }
                      )
                  ),
              )
          ),
          )
        ],
      )
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/style/common_text_style.dart';

class FriendsDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                IconButton(onPressed: (){}, icon: Icon(Icons.person_search, color: Colors.black87,))
              ],
            ),
          ),

          Container(

              child:Expanded(child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return Column(
                        children: [
                          ListTile(
                              title: Row(
                                children: [
                                  Icon(Icons.person, color: Colors.blueAccent, size: 20),
                                  SizedBox(width: 8,),
                                  Text("admin@admin.com" , style: subText())
                                ],
                              ),
                              trailing : TextButton(
                                child: Text('삭제', style: TextStyle(fontSize: 10),),
                                onPressed: (){},
                              )
                          ),
                          SizedBox( width: MediaQuery.of(context).size.width, child: Container(height: 1, color: Colors.black12,),)
                        ]
                    );
              }
          )) ),

        ],
      )
    );
  }
}

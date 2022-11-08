import 'package:demo/screens/event_screen.dart';
import 'package:demo/screens/favorite_list_screen.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/notice_screen.dart';
import 'package:demo/widgets/drawer/drawer_header.dart';
import 'package:flutter/material.dart';

import '../../screens/profile_screen.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 24, 40),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomDrawerHeader(),
              Divider(
                color: Colors.black54,
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
                title: Text('홈'),
                trailing: Icon(Icons.arrow_forward_ios_outlined,
                size: 28,),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: Icon(
                  Icons.favorite_outline,
                  size: 28,
                ),
                title: Text('찜 목록'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FavoriteListScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: Icon(
                  Icons.person_outlined,
                  size: 28,
                ),
                title: Text('마이페이지'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: Icon(
                  Icons.campaign_outlined,
                  size: 28,
                ),
                title: Text('공지사항'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NoticeScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: Icon(
                  Icons.calendar_today_outlined,
                  size: 28,
                ),
                title: Text('이벤트'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EventScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              Divider(
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}

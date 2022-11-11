import 'package:demo/screens/event_screen.dart';
import 'package:demo/screens/favorite_list_screen.dart';
import 'package:demo/screens/notice_screen.dart';
import 'package:demo/utilities/spring_api.dart';
import 'package:demo/widgets/drawer/drawer_header.dart';
import 'package:demo/widgets/screen_controller.dart';
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
              const Divider(
                color: Colors.black54,
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
                title: const Text('홈'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,
                size: 28,),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const ScreenController();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: const Icon(
                  Icons.favorite_outline,
                  size: 28,
                ),
                title: const Text('찜 목록'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const FavoriteListScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: const Icon(
                  Icons.person_outlined,
                  size: 28,
                ),
                title: const Text('마이페이지'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ProfileScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: const Icon(
                  Icons.campaign_outlined,
                  size: 28,
                ),
                title: const Text('공지사항'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const NoticeScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              ListTile(
                leading: const Icon(
                  Icons.calendar_today_outlined,
                  size: 28,
                ),
                title: const Text('이벤트'),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const EventScreen();
                  }));
                },
              ),
              SizedBox(height: size.height * 0.01,),
              const Divider(
                color: Colors.black54,
              ),
              TextButton(onPressed: (){SpringApi.logOut();}, child: Text("로그아웃"))
            ],
          ),
        ),
      ),
    );
  }
}

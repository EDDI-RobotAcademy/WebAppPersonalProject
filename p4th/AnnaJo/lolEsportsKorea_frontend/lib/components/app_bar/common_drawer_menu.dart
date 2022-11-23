import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lol_esports_korea_app/pages/authentication/my_page.dart';
import 'package:lol_esports_korea_app/pages/home_page.dart';

import 'drawer_list_tile.dart';

/// 상단 앱바에서 메뉴 아이콘을 클릭했을시 왼쪽에 나타나는 Drawer Menu
class CommonDrawerMenu extends StatefulWidget {
  CommonDrawerMenu({Key? key}) : super(key: key);

  @override
  State<CommonDrawerMenu> createState() => _CommonDrawerMenuState();
}

class _CommonDrawerMenuState extends State<CommonDrawerMenu> {
  static final _storage = FlutterSecureStorage();
  dynamic nickname = '';
  dynamic email = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _memberInfoRead();
    });
  }

  _memberInfoRead() async {
    nickname = await _storage.read(key: 'nickname');
    email = await _storage.read(key: 'email');
    setState(() {
      nickname = nickname;
      email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo.png"),
            backgroundColor: Colors.black,
          ),
          accountName: Text(nickname),
          accountEmail: Text(email),
        ),
        DrawerListTile(
            pageName: () => const HomePage(),
            pageTitle: 'Home',
            iconsName: Icons.home),
        DrawerListTile(
            pageName: () => const MyPage(),
            pageTitle: 'My Page',
            iconsName: Icons.account_circle_rounded),
      ],
    );
  }
}

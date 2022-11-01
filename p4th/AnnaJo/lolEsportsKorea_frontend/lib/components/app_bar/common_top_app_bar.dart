import 'package:flutter/material.dart';
import '../../pages/setting_page.dart';

/// 모든 페이지에 공통되게 사용되는 Top App Bar
class CommonTopAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color backgroundColor = Colors.deepPurple;
  final Text title;
  final AppBar appBar;
  // final List<Widget> widgets;

  const CommonTopAppBar({Key? key,
    required this.title,
    required this.appBar,
    // required this.widgets
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: backgroundColor,
      actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          //설정 페이지 연결
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const SettingPage();
              })
          );}
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

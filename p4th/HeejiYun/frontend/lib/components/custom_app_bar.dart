import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  const CommonAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0.0,
      title: Text(title),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
          )
      )
      ,
      centerTitle: true,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

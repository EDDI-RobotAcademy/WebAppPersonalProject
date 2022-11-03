import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CommonAppBar({Key? key ,required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorStyle.defaultBackground,
      leading:
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {  },),
      title: const Image(image: AssetImage("assets/images/TRANSMONSTERLOGO.png") , height: 80, width: 80,),
      centerTitle: true,
    );
  }

}
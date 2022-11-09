import 'package:demo/widgets/custom_appbar.dart';
import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: customAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("찜목록 리스트", style: TextStyle(
            fontSize: 30
          ),),
        ],
      ),
    );
  }
}

import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        title: Text('EZ.COOK'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("찜목록 리스트", style: TextStyle(
            fontSize: 30
          ),),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/app_bar/bottom_navigation_bar.dart';
import '../components/app_bar/common_drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: CommonDrawerMenu(),
      ),
      body: const Center(child: BottomBar()),
    );
  }
}

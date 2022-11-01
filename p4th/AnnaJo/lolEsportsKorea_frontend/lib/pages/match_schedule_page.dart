import 'package:flutter/material.dart';
import '../components/app_bar/common_drawer_menu.dart';
import '../components/app_bar/common_top_app_bar.dart';

class MatchSchedulePage extends StatefulWidget {
  const MatchSchedulePage({Key? key}) : super(key: key);

  @override
  _MatchScheduleState createState() => _MatchScheduleState();
}

class _MatchScheduleState extends State<MatchSchedulePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopAppBar(
        title: const Text('경기 일정'),
        appBar: AppBar(),
      ),
      drawer: const Drawer(
        child: CommonDrawerMenu(),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('TODAY',
            style: TextStyle(
              color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}


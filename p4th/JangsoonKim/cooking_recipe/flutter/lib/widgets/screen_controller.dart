import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/more_information_screen.dart';
import 'package:demo/screens/recipe/recipe_register_screen.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int _selectedIndex = 0;


  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const RecipeRegisterScreen(),
    const MoreInformationScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
             CupertinoIcons.search,
              size: 30,
            ),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.plus,
              size: 30,
            ),
            label: '레시피 등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              size: 30,
            ),
            label: '더 보기',
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: AppTheme.indiaInk,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

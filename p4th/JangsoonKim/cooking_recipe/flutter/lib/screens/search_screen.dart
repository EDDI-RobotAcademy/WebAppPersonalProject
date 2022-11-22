import 'package:demo/app_theme.dart';
import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/custom_drawer.dart';
import '../widgets/search_form.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: customAppbar('검색하기'),
      backgroundColor: AppTheme.natureWhite,
      body: SearchForm()
    );
  }
}

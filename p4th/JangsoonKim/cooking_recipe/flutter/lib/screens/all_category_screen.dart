import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../widgets/all_category_form.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer/custom_drawer.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: customAppbar('레시피'),
      backgroundColor: AppTheme.natureWhite,
      body: const AllCategoryForm(),
    );
  }
}

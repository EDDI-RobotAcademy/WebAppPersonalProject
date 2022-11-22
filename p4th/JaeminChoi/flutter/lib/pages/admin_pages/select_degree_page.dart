import 'package:flutter/material.dart';

import '../../components/Forms/admin_form/select_degree_form.dart';

class SelectDegreePage extends StatelessWidget{
  const SelectDegreePage({Key? key}) :super (key:key);
  final useForModifyPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SelectDegreeForm(UseedPosition: useForModifyPosition,)
              ],
            ),

          ),
        ),
      )
    );
  }
}
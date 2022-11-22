import 'package:flutter/material.dart';

import '../../components/Forms/admin_form/_input_modify_form.dart';

class InputModifyPage extends StatelessWidget{
  const InputModifyPage({Key?key, required this.itemsList}) : super(key: key);

  final List<dynamic> itemsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 40,left: 45),
            child: Column(
              children: [
                InputModifyForm(itemsList: itemsList,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
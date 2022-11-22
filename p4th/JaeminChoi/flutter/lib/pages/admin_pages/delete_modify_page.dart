import 'package:flutter/material.dart';

import '../../components/Forms/admin_form/delete_modify_form.dart';

class DeleteModifyPage extends StatelessWidget{
  const DeleteModifyPage({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: SafeArea(
                child: DeleteModifyForm()
            ),
          ),
        )
    );
  }
}
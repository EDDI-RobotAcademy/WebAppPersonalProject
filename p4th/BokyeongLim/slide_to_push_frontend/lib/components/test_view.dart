
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/buttons.dart';
import '../utility/color.dart';

class TestHomeView extends StatefulWidget {
  var account;

  TestHomeView({
    Key? key,
    required this.account
  }) : super(key: key);

  @override
  State<TestHomeView> createState() => _TestHomeViewState();
}

class _TestHomeViewState extends State<TestHomeView> {
  var account;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    account = widget.account;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
         child: Container(
            child: TextButton(
              onPressed: (){ debugPrint(account.toString()); },
              child: Text('dggiehg', style:TextStyle(color: ColorPicker.subTextButton, fontSize: 18)),
              style: Buttons.defaultTextButton,
            )
         ),
      ),
    );
  }
}


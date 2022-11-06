import 'package:flutter/material.dart';

import '../../api/http_service_api.dart';

class CustomSwitch extends StatefulWidget {
   bool status;
   int boardNo;

   CustomSwitch({
     Key? key,
     required this.status,
     required this.boardNo,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool status;
  late int boardNo;

  @override
  void initState() {
    super.initState();
    status = widget.status;
    boardNo = widget.boardNo;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      activeColor: Colors.red,
      onChanged: (bool value) {
        HttpService().requestListChangeStatusFromSpring(boardNo);
        setState(() {
          status = value;
        });
      },
    );
  }
}

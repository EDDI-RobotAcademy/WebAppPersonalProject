import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controller/date_picker_controller.dart';
class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    Get.put(DatePickerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => Text(
            DateFormat('yyyy-MM-dd')
                .format(Get.find<DatePickerController>()
                .selectedDate.value)
                .toString(),
        )),
        SizedBox(width: 10),
        TextButton(
          onPressed: () => Get.find<DatePickerController>().chooseDate(context),
          child: Text('날짜 선택',),
        ),
      ],
    );
  }
}

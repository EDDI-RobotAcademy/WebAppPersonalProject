import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  var selectedDate = DateTime.now().obs;

  chooseDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 55),
      cancelText: 'Close',
    );

    if(pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
}
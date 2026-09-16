import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/form/TaskForm.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';


Future<void> ShowTaskSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: ColorManager.BrandPrimaryBackground,
    isDismissible: false,
    context: context,
    builder: (context) => 
          TaskForm()
      );
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/form/updatedtaskform.dart';


Future<void> showEditDialog({required BuildContext context, required String taskID}) {
  return showDialog(context: context, builder: (context) => Dialog(
    child: UpdateTaskForm(taskID: taskID),
  ));
}
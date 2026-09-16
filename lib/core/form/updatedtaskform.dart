import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/data/model/TaskDataModel.dart';
import 'package:flutter_application_1/core/share/custommainbtn.dart';
import 'package:flutter_application_1/core/share/fuction/showFailDialog.dart';
import 'package:flutter_application_1/core/share/fuction/showloadDialog.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homecubit.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class UpdateTaskForm extends StatefulWidget {
  final String taskID;
  UpdateTaskForm({super.key, required this.taskID});

  @override
  State<UpdateTaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<UpdateTaskForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  DateTime _selectedDate = DateTime.now();
  late TaskDataModel newtask;
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTaskID(Id: widget.taskID);
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LoadingGetTakByIdState) {
          showLoadingDialog(context: context, loadingMessage: 'loading...');
        }

        if (state is SuccessGetTaskByIdState) {
          newtask = getData(
            id: state.task.ID ?? '',
            title: state.task.Title,
            description: state.task.Description,
            dateTime: state.task.dateTime,
            isDone: state.task.isDone,
          );

          _titleController.text = newtask.Title;
          _descriptionController.text = newtask.Description;
        }

        if (state is FailedToGetTaskByIdState) {
          context.pop();

          showFailDialog(context: context, failMessage: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: .symmetric(
            horizontal: Units.getHeight(context: context, value: 5),
            vertical: Units.getHeight(context: context, value: 5),
          ),
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.getHeight(context: context, value: 20),
                vertical: Units.getHeight(context: context, value: 15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: const CloseButton(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Units.radius(context: context, value: 16),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'eg: Meeting with client',
                            hintStyle:
                                TextStyleManager.textStyleNeutralGhostR16(
                                  context,
                                ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorManager.NeutralLine,
                        ),
                        TextField(
                          controller: _descriptionController,
                          maxLines: 3,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Description',
                            hintStyle:
                                TextStyleManager.textStyleNeutralGhostR16(
                                  context,
                                ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030, DateTime.december),
                    onDateChanged: (DateTime selectedDate) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    },
                  ),
                  SizedBox(
                    height: Units.getHeight(context: context, value: 10),
                  ),
                  CutomeMainBtn(
                    btnTitle: 'Edit Task',
                    onPressed: () {
                      newtask = TaskDataModel(
                        ID: widget.taskID,
                        Title: _titleController.text,
                        Description: _descriptionController.text,
                        dateTime: newtask.dateTime,
                        isDone: newtask.isDone,
                      );
                      cubit.updateTask(taskID: widget.taskID, newTask: newtask);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TaskDataModel getData({
    required String id,
    required String title,
    required String description,
    required String dateTime,
    required bool isDone,
  }) => TaskDataModel(
    Title: title,
    dateTime: dateTime,
    Description: description,
    isDone: isDone,
    ID: id,
  );
}
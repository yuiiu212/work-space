import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/data/model/TaskDataModel.dart';
import 'package:flutter_application_1/core/share/fuction/showFailDialog.dart';
import 'package:flutter_application_1/core/share/fuction/showedittaskdialoug.dart';
import 'package:flutter_application_1/core/share/fuction/showloadDialog.dart';
import 'package:flutter_application_1/core/share/fuction/showsucessDialog.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homecubit.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homestate.dart' show HomeState, SuccessUpdateTaskState, LoadingTaskUpdateState, FailedToUpdateTaskState, LoadingTaskUpdateStatusState, SuccessUpdateTaskStatusState, FailedToUpdateTaskStatusState, SuccessTaskDeleteState, FailureTaskDeleteState, LoadingTaskDeleteState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';


class Taskitem extends StatefulWidget {
  final TaskDataModel tasks;

  const Taskitem({
    super.key,
    required this.tasks,
  });

  @override
  State<Taskitem> createState() => _TaskitemState();
}

class _TaskitemState extends State<Taskitem> {
  _TaskitemState();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Update Task
        if (state is LoadingTaskUpdateState) {
          showLoadingDialog(
            context: context,
            loadingMessage: 'Updating...',
          );
        }

        if (state is SuccessUpdateTaskState) {
          context.pop();
          context.pop();
          
          showSuccessDialog(
            context: context,
            successMessage: 'Task Updated!',
          );
        }

        if (state is FailedToUpdateTaskState) {
          context.pop();

          showFailDialog(
            context: context,
            failMessage: state.errorMessage,
          );
        }

        // Update Task Status
        if (state is LoadingTaskUpdateStatusState) {
          showLoadingDialog(
            context: context,
            loadingMessage: 'Loading...',
          );
        }

        if (state is SuccessUpdateTaskStatusState) {
          
          context.pop();
          
          showSuccessDialog(
            context: context,
            successMessage: 'Task Updated!',
          );
        }

        if (state is FailedToUpdateTaskStatusState) {
          context.pop();

          showFailDialog(
            context: context,
            failMessage: state.errorMessage,
          );
        }

        // Delete Task
        if (state is LoadingTaskDeleteState) {
          showLoadingDialog(
            context: context,
            loadingMessage: 'Deleting...',
          );
        }

        if (state is SuccessTaskDeleteState) {
          context.pop();
          context.pop();

          showSuccessDialog(
            context: context,
            successMessage: 'Task Deleted!',
          );
        }

        if (state is FailureTaskDeleteState) {
          context.pop();

          showFailDialog(
            context: context,
            failMessage: state.errorMessage,
          );
        }
      },

      builder: (context, state) {
        return GestureDetector(
          onLongPress: () => showEditDialog(
            context: context,
            taskID: widget.tasks.ID ?? '',
          ),

          child: Container(
            padding: .only(
              top: Units.getWidth(
                context: context,
                value: 36,
              ),
            ),

            decoration: BoxDecoration(
              color: ColorManager.BrandPrimaryDefault,

              borderRadius: .circular(
                Units.radius(
                  context: context,
                  value: 8,
                ),
              ),

              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 10,
                  offset: Offset.zero,
                  color: ColorManager.Shadow,
                ),
              ],
            ),

            child: Card(
              margin: .zero,
              color: ColorManager.NeutralWhite,

              shape: ContinuousRectangleBorder(
                borderRadius: .vertical(
                  top: .zero,
                  bottom: .circular(
                    Units.radius(
                      context: context,
                      value: 8,
                    ),
                  ),
                ),
              ),

              child: Padding(
                padding: .symmetric(
                  horizontal: Units.getHeight(
                    context: context,
                    value: 16,
                  ),
                ),

                child: Column(
                  crossAxisAlignment: .start,

                  children: [
                    Padding(
                      padding: .symmetric(
                        vertical: Units.getWidth(
                          context: context,
                          value: 16,
                        ),
                      ),

                      child: Row(
                        spacing: Units.getWidth(
                          context: context,
                          value: 12,
                        ),

                        children: [
                          Checkbox(
                            value: widget.tasks.isDone,

                            onChanged: (value) {
                              setState(() {
                                widget.tasks.isDone = value!;

                                cubit.updateTaskStatus(
                                  taskID: widget.tasks.ID ?? '',
                                  isDone: widget.tasks.isDone,
                                );
                              });
                            },

                            activeColor: ColorManager.BrandButton,
                          ),

                          Text(
                            widget.tasks.Title,
                            style:
                                TextStyleManager
                                    .textStyleNeutralPrimaryM16(
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Text(
                      widget.tasks.Description,
                      style:
                          TextStyleManager
                              .textStyleNeutralSecondaryR12(
                        context,
                      ),
                    ),

                    // Delete Button
                    Align(
                      alignment: Alignment.centerRight,

                      child: IconButton(
                        onPressed: () {
                          cubit.deleteTask(
                            taskID: widget.tasks.ID ?? '',
                          );
                        },

                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),

                    Divider(
                      endIndent: Units.getHeight(
                        context: context,
                        value: 16,
                      ),

                      indent: Units.getHeight(
                        context: context,
                        value: 16,
                      ),
                    ),

                    Container(
                      padding: .only(
                        bottom: Units.getWidth(
                          context: context,
                          value: 16,
                        ),
                      ),

                      alignment: .bottomEnd,

                      child: Text(
                        widget.tasks.dateTime.toString(),
                        style:
                            TextStyleManager
                                .textStyleNeutralSecondaryR12(
                          context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
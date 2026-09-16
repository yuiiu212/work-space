import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/share/fuction/showFailDialog.dart';
import 'package:flutter_application_1/core/share/textitem.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homecubit.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTask();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previos , current)=> (
        current is InitialTaskGettingState ||
        current is LoadingTaskGettingState ||
        current is SuccessTaskGettingState ||
        current is FailureTaskGettingState
      ) ,
      builder: (context, state) {
        if (state is LoadingTaskGettingState) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.BrandPrimaryDefault,
            ),
          );
        }

        if (state is SuccessTaskGettingState) {
          final tasks = state.tasks;

          if (tasks.isEmpty) {
            return Center(
              child: Text(
                'No tasks available',
                style: TextStyleManager.textStyleNeutralGhostR16(context),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Units.getWidth(context: context, value: 20),
            ),
            child: ListView.separated(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Taskitem(tasks: tasks[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: Units.getHeight(context: context, value: 10),
                );
              },
            ),
          );
        }
        if (state is FailureTaskGettingState) {
          showFailDialog(context: context, failMessage: state.errorMessage);
        }

        return const SizedBox();
      },
    );
  }
}
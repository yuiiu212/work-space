import 'package:flutter_application_1/core/data/model/TaskDataModel.dart';

abstract class HomeState {}
// Delete task

class InitialTaskDeleteState extends HomeState {}

class LoadingTaskDeleteState extends HomeState {}

class SuccessTaskDeleteState extends HomeState {}

class FailureTaskDeleteState extends HomeState {
  final String errorMessage;

  FailureTaskDeleteState({
    required this.errorMessage,
  });
}

class HomeInitialState extends HomeState {}

class InitialTaskCreationState extends HomeState {}

class LoadingTaskCreationState extends HomeState {}

class SuccessTaskCreationState extends HomeState {}

class FailureTaskCreationState extends HomeState {
  final String errorMessage;
  FailureTaskCreationState({required this.errorMessage});
}

class InitialTaskGettingState extends HomeState {}

class LoadingTaskGettingState extends HomeState {}

class SuccessTaskGettingState extends HomeState {
  final List<TaskDataModel> tasks;
  SuccessTaskGettingState({required this.tasks});
}

class FailureTaskGettingState extends HomeState {
  final String errorMessage;
  FailureTaskGettingState({required this.errorMessage});
}

//get task by id
class InitialGetTakByIdState extends HomeState {}

class LoadingGetTakByIdState extends HomeState {}

class SuccessGetTaskByIdState extends HomeState {
  final TaskDataModel task;
  SuccessGetTaskByIdState({required this.task});
}

class FailedToGetTaskByIdState extends HomeState {
  final String errorMessage;
  FailedToGetTaskByIdState({required this.errorMessage});
}

//status
class InitialTaskUpdateStatusState extends HomeState {}

class LoadingTaskUpdateStatusState extends HomeState {}

class SuccessUpdateTaskStatusState extends HomeState {}

class FailedToUpdateTaskStatusState extends HomeState {
  final String errorMessage;
  FailedToUpdateTaskStatusState({required this.errorMessage});
}

class InitialTaskUpdateState extends HomeState {}

class LoadingTaskUpdateState extends HomeState {}

class SuccessUpdateTaskState extends HomeState {}

class FailedToUpdateTaskState extends HomeState {
  final String errorMessage;
  FailedToUpdateTaskState({required this.errorMessage});
  // Delete task
}

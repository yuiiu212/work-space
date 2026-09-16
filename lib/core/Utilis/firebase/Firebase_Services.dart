import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/Utilis/Constans.dart';
import 'package:flutter_application_1/core/data/model/TaskDataModel.dart';


class FirebaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference<TaskDataModel> docRef(TaskDataModel task) {
    return firestore
        .collection(Constans.FirebaseTaskCollection)
        .withConverter<TaskDataModel>(
          fromFirestore: (snapshot, options) =>
              TaskDataModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => task.toFirestore(),
        )
        .doc();
  }

  Future<void> createTask(TaskDataModel task) async {
    final doc = docRef(task);

    task.ID = doc.id;

    await doc.set(task);
  }

  Stream<List<TaskDataModel>> getTask() => firestore
      .collection(Constans.FirebaseTaskCollection)
      .orderBy('dateTime', descending: true)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((doc) => TaskDataModel.fromJson(doc.data()))
            .toList(),
      );

  Future<TaskDataModel> getTaskByID({required String taskID}) async {
    final task = await firestore
        .collection(Constans.FirebaseTaskCollection)
        .doc(taskID)
        .get();

    return TaskDataModel.fromJson(task.data()!);
  }

  Future<void> updateTaskStatus({
    required String taskID,
    required bool isDone,
  }) async {
    await firestore
        .collection(Constans.FirebaseTaskCollection)
        .doc(taskID)
        .update({'isDone': isDone});
  }

  Future<void> updateTask({
    required String taskID,
    required TaskDataModel newTask,
  }) async {
    newTask.ID = taskID;

    await firestore
        .collection(Constans.FirebaseTaskCollection)
        .doc(taskID)
        .update(newTask.toFirestore());
  }

  Future<void> deleteTask({required String taskID}) async {
    await firestore
        .collection(Constans.FirebaseTaskCollection)
        .doc(taskID)
        .delete();
  }
}
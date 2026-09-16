class TaskDataModel {
  String? ID;
  String Title;
  String Description;
  String dateTime;
  bool isDone;
  TaskDataModel({
    this.ID,
    required this.Title,
    required this.Description,
    required this.dateTime,
    this.isDone = false
  });
  factory TaskDataModel.fromJson(Map<String, dynamic> Json) => TaskDataModel(
    ID: Json['ID'] ?? '0',
    Title: Json['Title'],
    Description: Json['Description'],
    dateTime: Json['dateTime'],
    isDone: Json['isDone']??false,
  );
  Map<String, dynamic> toFirestore() => {
    'ID': ID ?? '',
    'Title': Title,
    'Description': Description,
    'dateTime': dateTime,
    'isDone': isDone,
  };
}
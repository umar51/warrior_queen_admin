import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{

  String? task;
  int? taskDate;
  DocumentReference? docRef;

  TaskModel({this.docRef,this.task,this.taskDate});

  factory TaskModel.fromDocumentSnapshot(DocumentSnapshot doc){
    return TaskModel(
      docRef: doc.reference,
      taskDate: doc['task_date'],
      task: doc['task'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'task': task,
      'task_date': taskDate,
    };
  }
}
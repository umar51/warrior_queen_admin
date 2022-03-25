import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{

  String? task;
  int? taskDate;
  String? image;
  DocumentReference? docRef;

  TaskModel({this.docRef,this.task,this.taskDate,this.image});

  factory TaskModel.fromDocumentSnapshot(DocumentSnapshot doc){
    return TaskModel(
      docRef: doc.reference,
      taskDate: doc['task_date'],
      task: doc['task'],
      image: doc['image'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'task': task,
      'task_date': taskDate,
      'image': image,
    };
  }
}
import "package:cloud_firestore/cloud_firestore.dart";

class UserModel {
  String? userName;
  String? email;
  String? userId;

  UserModel({
    this.email,
    this.userName,
    this.userId,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) => UserModel(
        email: doc['email'],
        userName: doc['userName'],
      );
  factory UserModel.fromLocalStore(Map<String,dynamic> data) => UserModel(
    email: data['email'],
    userId: data['userId'],
  );
  Map<String, dynamic> toMap() => {
        'email': email,
        'userName': userName,
  };
  Map<String, dynamic> toLocalStore() => {
    'email': email,
    'userId': userId,
  };
    
  
}

import "package:cloud_firestore/cloud_firestore.dart";

class UserModel {
  String? userName;
  String? email;

  UserModel({
    this.email,
    this.userName,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) => UserModel(
        email: doc['email'],
        userName: doc['userName'],
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'userName': userName,
      };
    
  
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{

  String? categoryName;
  String? categoryImage;
  DocumentReference? docRef;

  CategoryModel({this.categoryName,this.docRef,this.categoryImage});

  factory CategoryModel.fromDocumentSnapshot(DocumentSnapshot doc){
    return CategoryModel(
      docRef: doc.reference,
      categoryName: doc['category'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'category' : categoryName,
      'category_image' : categoryImage,
    };
  }
}
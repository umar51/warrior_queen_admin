import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warrior_queen_admin/constants.dart';
import 'package:warrior_queen_admin/models/category_model.dart';

class CategoryController extends GetxController{

  CategoryModel addCategoryModel = CategoryModel();
  final catFormKey = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  final _catCollectionReference = FirebaseFirestore.instance.collection('category');

  validateCategoryForm(){
    if(!catFormKey.currentState!.validate()){
      return null;
    }
    addCategoryModel = CategoryModel(categoryName: categoryNameController.text);
    addCategory();
  }

  addCategory(){
    try {
      _catCollectionReference
          .add(addCategoryModel.toMap())
          .then((value) => Get.snackbar('Success', 'Category Added',backgroundColor: kblack,colorText: kwhite))
          .catchError((onError) => Get.snackbar('Error', onError.toString(),backgroundColor: kblack,colorText: kwhite));
    }catch(e){
      Get.snackbar('Error', e.toString(),backgroundColor: kblack,colorText: kwhite);
    }
  }

}
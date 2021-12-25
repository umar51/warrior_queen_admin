import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:warrior_queen_admin/constants.dart';
import 'package:warrior_queen_admin/models/category_model.dart';
import 'package:warrior_queen_admin/models/task_model.dart';

class CategoryController extends GetxController{

  CategoryModel addCategoryModel = CategoryModel();
  TaskModel addTaskModel = TaskModel();
  final catFormKey = GlobalKey<FormState>();
  final taskFormKey = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  final taskNameController = TextEditingController();
  final DateRangePickerController dateRangePickerController = DateRangePickerController();
  final _catCollectionReference = FirebaseFirestore.instance.collection('category');
  List<CategoryModel> listOfCategories = [];
  List<TaskModel> listOfTasks = [];
  int selectedCategoryIndex = 0;

  validateCategoryForm(){
    if(!catFormKey.currentState!.validate()){
      return null;
    }
    addCategoryModel = CategoryModel(categoryName: categoryNameController.text);
    addCategory();
  }

  validateTaskForm(){
    if(!taskFormKey.currentState!.validate()){
      return null;
    }else if(dateRangePickerController.selectedDate == null){
      Get.snackbar('Alert', 'Select Date',backgroundColor: kblack,colorText: kwhite);
    }else {
      addTaskModel = TaskModel(task: taskNameController.text,
          taskDate: dateRangePickerController.selectedDate!
              .millisecondsSinceEpoch);
      addTask();
    }
  }
  addTask(){
    try {
      listOfCategories[selectedCategoryIndex]
          .docRef!
          .collection('tasks')
          .add(addTaskModel.toMap())
          .then((value) => Get.snackbar('Success', 'Task Added',backgroundColor: kblack,colorText: kwhite));
    }catch(e){
      Get.snackbar('Error', e.toString(),backgroundColor: kblack,colorText: kwhite);
    }
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

  mapSelectedCategory(int index){
    selectedCategoryIndex = index;
  }

  getCategories(){
    if(listOfCategories.isEmpty) {
      listOfCategories.clear();
      _catCollectionReference
          .get()
          .then((value) {
        value.docs.forEach((element) {
          CategoryModel categoryModel = CategoryModel.fromDocumentSnapshot(
              element);
          listOfCategories.add(categoryModel);
        });
        update();
      });
    }
  }

  getTasks(){
      listOfTasks.clear();
          listOfCategories[selectedCategoryIndex]
          .docRef!
          .collection('tasks')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          TaskModel taskModel = TaskModel.fromDocumentSnapshot(element);
          listOfTasks.add(taskModel);
        });
        update();
      });
  }

}
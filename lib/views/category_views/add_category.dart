import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:warrior_queen_admin/controllers/category_controller.dart';

import '../../constants.dart';

class AddCategoryPage extends StatelessWidget {

  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: kblack,
        toolbarHeight: 70,
        title: const Center(
          child: Text(
            'Admin Panel',
            style: TextStyle(color: kwhite, fontSize: 18),
          ),
        ),
      ),
      body: Center(
        child: GetBuilder<CategoryController>(
          builder: (controller){
            return Form(
              key: categoryController.catFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      
                      controller: categoryController.categoryNameController,
                      validator: (val){
                        if(val!.isEmpty){
                          return 'This is a Required Field';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Category Name'
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 150,
                    color: Colors.purpleAccent,
                    child: TextButton(
                      onPressed: () => categoryController.validateCategoryForm(),
                      child: const Text("Add Category",style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

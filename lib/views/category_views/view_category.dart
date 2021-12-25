import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:warrior_queen_admin/constants.dart';
import 'package:warrior_queen_admin/controllers/category_controller.dart';
import 'package:warrior_queen_admin/views/task_views/add_task.dart';
import 'package:warrior_queen_admin/views/task_views/view_tasks.dart';

class ViewCategoryPage extends StatelessWidget {

  final _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    _categoryController.getCategories();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblack,
        title: const Center(child: Text('Admin Panel')),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<CategoryController>(
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(50),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(2),
                        },
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Text('Category')
                            ]),
                            Column(children: [
                              Text('list of Tasks')
                            ]),
                            Column(children: [
                              Text('Actions')
                            ]),
                          ]),

                          for(int i=0;i<_categoryController.listOfCategories.length;i++)
                            TableRow(children: [
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '${_categoryController.listOfCategories[i].categoryName}',
                                    textAlign: TextAlign.center,
                                  )
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      _categoryController.mapSelectedCategory(i);
                                      Get.to(() => ViewTasksPage());
                                    },
                                    child: Text(
                                      'Tasks',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                      }, icon: Icon(Icons.edit)),
                                  SizedBox(width: 20,),
                                  IconButton(
                                      onPressed: (){
                                      }, icon: Icon(Icons.delete)),
                                ],
                              )
                            ]),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:warrior_queen_admin/constants.dart';
import 'package:warrior_queen_admin/controllers/category_controller.dart';
import 'package:warrior_queen_admin/views/category_views/add_category.dart';
import 'package:warrior_queen_admin/views/task_views/add_task.dart';

class ViewTasksPage extends StatelessWidget {

  final _categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    _categoryController.getTasks();
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
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: 150,
                      color: Colors.purpleAccent,
                      child: TextButton(
                        onPressed: () => Get.to(() => AddTaskPage()),
                        child: const Text("Add Task",style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 10,),
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
                              Text('Task')
                            ]),
                            Column(children: [
                              Text('Date')
                            ]),
                            Column(children: [
                              Text('Actions')
                            ]),
                          ]),

                          for(int i=0;i<_categoryController.listOfTasks.length;i++)
                            TableRow(children: [
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '${_categoryController.listOfTasks[i].task}',
                                    textAlign: TextAlign.center,
                                  )
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '${DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(_categoryController.listOfTasks[i].taskDate!))}',
                                    textAlign: TextAlign.center,
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

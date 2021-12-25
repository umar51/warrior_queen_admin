import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:warrior_queen_admin/controllers/category_controller.dart';

import '../../constants.dart';

class AddTaskPage extends StatelessWidget {

  final _categoryController = Get.find<CategoryController>();

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
              key: _categoryController.taskFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _categoryController.taskNameController,
                      validator: (val){
                        if(val!.isEmpty){
                          return 'This is a Required Field';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Task'
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.single,
                    controller: _categoryController.dateRangePickerController,
                    view: DateRangePickerView.month,
                    monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 150,
                    color: Colors.purpleAccent,
                    child: TextButton(
                      onPressed: () => _categoryController.validateTaskForm(),
                      child: const Text("Add Task",style: TextStyle(fontSize: 20,color: Colors.white)),
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

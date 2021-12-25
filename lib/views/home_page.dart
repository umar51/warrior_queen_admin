import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warrior_queen_admin/constants.dart';
import 'package:warrior_queen_admin/views/category_views/add_category.dart';
import 'package:warrior_queen_admin/views/category_views/view_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: kblack,
        toolbarHeight: 70,
        title: const Center(
          child: Text(
            'Admin Panel',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 150,
              color: Colors.purpleAccent,
              child: TextButton(
                onPressed: () {
                   Get.to(() => AddCategoryPage());
                },
                child: const Text("Add Category",style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 150,
              color: Colors.purpleAccent,
              child: TextButton(
                onPressed: () {
                  Get.to(() => ViewCategoryPage());
                },
                child: const Text("View Category",style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

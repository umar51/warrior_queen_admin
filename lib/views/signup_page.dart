import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        width: Get.width / 4,
        height: Get.height / 3,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.greenAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(6.sp),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                blurRadius: 1.sp,
                offset: Offset(1.w, 5.h),
              )
            ]),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Passward',
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {},
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

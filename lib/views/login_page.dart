import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:warrior_queen_admin/controllers/auth_controller.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              width: Get.width / 2,
              height: Get.height / 1.5,
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
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: authController.passwordController,
                      decoration: InputDecoration(
                        labelText: 'Passward',
                      ),
                    ),
                    SizedBox(
                      height: 125.h,
                    ),

                    ///button login
                    ///
                    ///
                    InkWell(
                      onTap: () {
                        authController.logIn();
                      },
                      child: logInButton(
                        titleText: 'Log In',
                      ),
                    ),
                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //     fixedSize: MaterialStateProperty.all(Size(30.w, 60)),
                    //     backgroundColor:
                    //         MaterialStateProperty.all(Colors.green),
                    //     elevation: MaterialStateProperty.all(4),
                    //   ),
                    //   onPressed: () {
                    //     authController.logIn();
                    //   },
                    //   child: Text('Log In'),
                    // ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text('Click here to Sign up '),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class logInButton extends StatelessWidget {
  String? titleText;
  logInButton({
    this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          titleText!,
          style: TextStyle(
            fontSize: 6.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:warrior_queen_admin/controllers/auth_controller.dart';
import 'package:warrior_queen_admin/views/home_page.dart';
import 'package:warrior_queen_admin/views/login_page.dart';
import 'package:warrior_queen_admin/views/signup_page.dart';

class LandingPage extends StatelessWidget {

  final authController = Get.put(AuthController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (controller){
          return FutureBuilder(
            future: authController.checkIfUserLoggedIn(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if(snapshot.hasData && snapshot.data == true){
                return HomePage();
              }else{
                return LogInPage();
              }
            },
          );
        },
      ),
    );
  }
}

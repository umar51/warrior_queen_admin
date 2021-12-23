import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:warrior_queen_admin/views/login_page.dart';
import 'package:warrior_queen_admin/views/signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInPage(),
    );
  }
}

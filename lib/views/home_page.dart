import 'package:flutter/material.dart';
import 'package:warrior_queen_admin/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: kblack,
        toolbarHeight: 70,
        title: Row(
          children: const [
            Text(
              'Admin Panel',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}

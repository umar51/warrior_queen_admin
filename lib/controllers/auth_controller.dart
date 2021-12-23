import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warrior_queen_admin/models/user_model.dart';

class AuthController extends GetxController {
  UserModel loggedInUser = UserModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  clearTextControllers() {
    emailController.clear();
    userNameController.clear();
    passwordController.clear();
    update();
  }

  // registerUser() async {
  //   var authUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  //   UserModel newUser = UserModel(
  //     userName: userNameController.text,
  //     email: emailController.text,
  //   );
  //   try {
  //     //adding newuser to collection
  //     await userCollection.doc(authUser.user!.uid).set(newUser.toMap());

  //     DocumentSnapshot doc = await userCollection.doc(authUser.user!.uid).get();
  //     loggedInUser = UserModel.fromDocumentSnapshot(doc);
  //     update();

  //     clearTextControllers();

  //     Get.snackbar('Registration Successful', 'Account created successfully');
  //   } catch (e) {
  //     Get.snackbar('Registration Failed', '$e');
  //   }
  // }

  logIn() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      DocumentSnapshot doc = await userCollection.doc(user.user!.uid).get();

      loggedInUser = UserModel.fromDocumentSnapshot(doc);
      update();
      clearTextControllers();
      Get.snackbar('Log In Successfull', 'Account logged in.');
    } catch (e) {
      Get.snackbar('Log In Failed', '$e');
    }
  }
}

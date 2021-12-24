import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
import 'package:warrior_queen_admin/models/user_model.dart';
import 'package:warrior_queen_admin/views/home_page.dart';

import '../constants.dart';

class AuthController extends GetxController {

  UserModel currentUser = UserModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;
  final loginFormKey = GlobalKey<FormState>();
  bool isButtonVisible = true;
  final localStore = Localstore.instance;

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

  Future<bool> checkIfUserLoggedIn() async {
    UserModel data = UserModel();
    await localStore.collection('user').get().then((value) {
      if (value != null) {
        value.forEach((key, value) {
          data = UserModel.fromLocalStore(value);
        });
      }
    });
    if (data != null && data.userId != null) {
      currentUser = UserModel(
        email: data.email,
        userId: data.userId,
      );
      return true;
    }
    return false;
  }

  validateLoginForm(){
    if(!loginFormKey.currentState!.validate()){
      return null;
    }
    loginUser();
  }
  loginUser() async {
    try{
      isButtonVisible = false;
      update();
      UserCredential user = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if(user.user != null){
        Get.snackbar('Success', 'You are Logged In',backgroundColor: kblack,colorText: kwhite);
        currentUser = UserModel(userId: user.user!.uid,email: emailController.text);
        clearTextControllers();
        isButtonVisible = true;
        await localStore
            .collection('user')
            .doc(currentUser.userId)
            .set(currentUser.toLocalStore());
        Get.to(() => const HomePage());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Log In Failed', e.code,backgroundColor: kblack,colorText: kwhite);
    }finally{
      isButtonVisible = true;
      update();
    }
  }


}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupController extends GetxController {
//   static SignupController get instance => Get.find();

//   var passwordVisible = true.obs;

//   var agreeToTerms = false.obs;

//   // Textfield controller to data from textfield
//   final email = TextEditingController();
//   final username = TextEditingController();
//   final password = TextEditingController();

//   // call the function from the design and rest will be taken care here
//   // void registerUser(String email, String password) {
//   //   SignupRepository.instance.createUserWithEmailAndPassword(email, password);
//   // }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isPasswordObscured = true.obs;

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'dob': '',
        'gender': '',
        'phone': '',
      });

      // Update the user's profile
      await userCredential.user?.updateDisplayName(name);

      Get.offNamed(AppRoutes.navBarScreen);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

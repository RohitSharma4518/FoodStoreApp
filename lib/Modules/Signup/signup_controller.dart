import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Signup/signup_repository.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  var passwordVisible = true.obs;

  var agreeToTerms = false.obs;

  // Textfield controller to data from textfield
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  // call the function from the design and rest will be taken care here
  // void registerUser(String email, String password) {
  //   SignupRepository.instance.createUserWithEmailAndPassword(email, password);
  // }
}

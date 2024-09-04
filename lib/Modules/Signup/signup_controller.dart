import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/firebase_custom_error_message.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodstore/Routes/app_routes.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  var isPasswordObscured = true.obs;
  var agreeToTerms = false.obs;

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

      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'dob': '',
        'gender': '',
        'phone': '',
      });

      await userCredential.user?.updateDisplayName(name);

      Get.offNamed(AppRoutes.loginScreen);
      Get.snackbar('Success', 'Account created successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      if (e is FirebaseAuthException) {
        String errorMessage = getFirebaseErrorMessage(e.code);
        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.TOP,
            backgroundColor: ColorConstants.cartDetailColor);
      } else {
        Get.snackbar("Error", "An Unexpected Error Occurred",
            snackPosition: SnackPosition.TOP,
            backgroundColor: ColorConstants.cartDetailColor);
      }
    }
  }
}

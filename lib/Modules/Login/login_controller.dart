import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/firebase_custom_error_message.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var passwordVisible = true.obs;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  RxBool signedIn = false.obs;

  void updateSignInStatus(bool status) async {
    signedIn.value = status;
    await GetStorage().write('isSignedIn', signedIn.value);
  }

  void SignedIn() async {
    bool currentStatus = GetStorage().read('isSignedIn') ?? false;
    updateSignInStatus(!currentStatus);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      updateSignInStatus(true);
      Get.offNamed(AppRoutes.navBarScreen);
      Get.snackbar('Success', 'User is successfully Signed In',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      if (e is FirebaseAuthException) {
        print("Firebase Auth Error Code: ${e.code}"); // Add this line to debug
        String errorMessage = getFirebaseErrorMessage(e.code);
        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print("Unexpected Error: ${e.toString()}");
        Get.snackbar(
          'Error',
          "An unexpected error occurred.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}

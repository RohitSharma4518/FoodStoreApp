// import 'package:get/get.dart';
// import 'package:foodstore/Modules/Login/login_repository.dart';

// class LoginController extends GetxController {
//   final LoginRepository repository;

//   LoginController(this.repository);

//   ///
//   /// login api call
//   login() async {
//     await repository.loginAPICall(
//       {
//         'email': 'test@gmail.com',
//         'password': '123456',
//       },
//     );

//     // rest code will write over here (Navigation & User Data Stoarage & Other Logic)
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordObscured = true.obs;

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offNamed(AppRoutes.navBarScreen);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}

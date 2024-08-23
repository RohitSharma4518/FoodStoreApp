// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:foodstore/Data/Api/api_execption.dart';
// import 'package:foodstore/Routes/app_routes.dart';
// import 'package:get/get.dart';

// class SignupRepository extends GetxController {
//   static SignupRepository get instance => Get.find();

//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     super.onReady();
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(AppRoutes.splashScreen)
//         : Get.offAll(AppRoutes.dashboardScreen);
//   }

//   // SignUp Cloud Function of registering User
//   Future<void> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       firebaseUser.value != null
//           ? Get.offAll(AppRoutes.dashboardScreen)
//           : Get.offAll(AppRoutes.loginScreen);
//     } on FirebaseAuthException catch (e) {
//       final ex = AppException.code(e.code);
//       print('Firebase Auth Exception - ${e.message}');
//       throw ex;
//     } catch (_) {
//       final ex = AppException();
//       print('Exception = ${ex.message}');
//       throw ex;
//     }
//   }

//   // Login Cloud Function for Signing User
//   Future<void> loginUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       e.message;
//     } catch (_) {}
//   }

//   // Logout User
//   Future<void> logOut() async => await _auth.signOut();
// }

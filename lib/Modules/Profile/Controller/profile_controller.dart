import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var name = ''.obs;
  var email = ''.obs;
  var dob = ''.obs;
  var gender = ''.obs;
  var phone = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await _firestore.collection('users').doc(user.uid).get();
      name.value = userData['name'] ?? '';
      email.value = userData['email'] ?? '';
      dob.value = userData['dob'] ?? '';
      gender.value = userData['gender'] ?? '';
      phone.value = userData['phone'] ?? '';
    }
  }

  Future<void> updateProfileData(String field, String value) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .update({field: value});
      } catch (e) {
        print("Error updating profile: $e");
      }
    }
  }
}

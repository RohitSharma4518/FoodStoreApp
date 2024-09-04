import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  var name = ''.obs;
  var email = ''.obs;
  var dob = ''.obs;
  var gender = ''.obs;
  var phone = ''.obs;
  var profileImage = ''.obs;

  var nameError = ''.obs;
  var dobError = ''.obs;
  var genderError = ''.obs;
  var phoneError = ''.obs;
  var imageError = ''.obs;

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
      profileImage.value = userData['profileImage'] ?? '';
    }
  }

  Future<void> updateProfileData(String field, String value) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).update({
          field: value,
        });
        fetchUserData();
      } catch (e) {
        print("Error updating profile: $e");
      }
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      await uploadProfileImage(imageFile);
    } else {
      imageError.value = 'Profile Image is required';
    }
  }

  Future<void> uploadProfileImage(File imageFile) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        Reference storageRef =
            _storage.ref().child('profile_images/${user.uid}.jpg');
        UploadTask uploadTask = storageRef.putFile(imageFile);

        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        await _firestore.collection('users').doc(user.uid).update({
          'profileImage': downloadUrl,
        });

        profileImage.value = downloadUrl;
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
  }

  bool validateProfile() {
    bool isValid = true;

    if (name.value.isEmpty) {
      nameError.value = 'Full name is required';
      isValid = false;
    } else {
      nameError.value = '';
    }

    if (dob.value.isEmpty) {
      dobError.value = 'Date of Birth is required';
      isValid = false;
    } else {
      dobError.value = '';
    }

    if (gender.value.isEmpty) {
      genderError.value = 'Gender is required';
      isValid = false;
    } else {
      genderError.value = '';
    }

    if (phone.value.isEmpty) {
      phoneError.value = 'Phone Number is required';
      isValid = false;
    } else if (!RegExp(r'^\d{10}$').hasMatch(phone.value)) {
      phoneError.value = 'Enter a valid phone number';
      isValid = false;
    } else {
      phoneError.value = '';
    }

    if (profileImage.value.isEmpty) {
      imageError.value = 'Profile image is required';
      isValid = false;
    } else {
      imageError.value = '';
    }

    return isValid;
  }
}

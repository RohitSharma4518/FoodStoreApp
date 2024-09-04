import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Profile/Controller/profile_controller.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController _profilecontroller = Get.put(ProfileController());
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        leading: Container(
          margin: const EdgeInsets.only(left: 24),
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.appBarColor, width: 1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(1),
            iconSize: 24,
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: ColorConstants.blackColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        leadingWidth: 60,
        toolbarHeight: 60,
        title: const CustomTextWidget(
          StringConstants.profileAppBarTxt,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: ColorConstants.blackColor,
                size: 24,
              ),
              onPressed: () {
                Get.toNamed(
                  AppRoutes.settingScreen,
                );
              },
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          _nameController.text = _profilecontroller.name.value;
          _emailController.text = _profilecontroller.email.value;
          _dobController.text = _profilecontroller.dob.value;
          _phoneController.text = _profilecontroller.phone.value;
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const CustomTextWidget("Gallery"),
                                  onTap: () {
                                    _profilecontroller
                                        .pickImage(ImageSource.gallery);
                                    Get.back();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const CustomTextWidget("Camera"),
                                  onTap: () {
                                    _profilecontroller
                                        .pickImage(ImageSource.camera);
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _profilecontroller
                                .profileImage.value.isNotEmpty
                            ? (_profilecontroller.profileImage.value
                                        .startsWith('http')
                                    ? NetworkImage(
                                        _profilecontroller.profileImage.value)
                                    : FileImage(File(
                                        _profilecontroller.profileImage.value)))
                                as ImageProvider
                            : const AssetImage(AssetConstant.profileAccntImg),
                        child: const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.4.h,
                  ),
                  const CustomTextWidget(
                    StringConstants.profileLabel1Txt,
                    color: ColorConstants.blackColor,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    controller: _nameController,
                    onChanged: (value) {
                      _profilecontroller.name.value = value;
                    },
                  ),
                  Obx(() {
                    return CustomTextWidget(
                      _profilecontroller.nameError.value,
                      color: ColorConstants.redColor,
                      fontSize: 10,
                    );
                  }),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  const Text(
                    StringConstants.profileLabel2Txt,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    isDatePicker: true,
                    controller: _dobController,
                    onChanged: (value) {
                      _profilecontroller.dob.value = value;
                    },
                  ),
                  Obx(() {
                    return CustomTextWidget(
                      _profilecontroller.dobError.value,
                      fontSize: 10,
                      color: ColorConstants.redColor,
                    );
                  }),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  const Text(
                    StringConstants.profileLabel3Txt,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    hintText: StringConstants.profileDropdwnTxt1,
                    dropdownItems: const [
                      StringConstants.profileDropdwnTxt1,
                      StringConstants.profileDropdwnTxt2,
                      StringConstants.profileDropdwnTxt3,
                    ],
                    isDropdown: true,
                    controller: TextEditingController(
                        text: _profilecontroller.gender.value),
                    onChanged: (value) {
                      _profilecontroller.gender.value = value;
                    },
                  ),
                  Obx(() {
                    return CustomTextWidget(
                      _profilecontroller.genderError.value,
                      color: ColorConstants.redColor,
                      fontSize: 10,
                    );
                  }),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  const Text(
                    StringConstants.profileLabel4Txt,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    hintText: StringConstants.profilePhoneTxt,
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _profilecontroller.phone.value = value;
                    },
                  ),
                  Obx(() {
                    return CustomTextWidget(
                      _profilecontroller.phoneError.value,
                      color: ColorConstants.redColor,
                      fontSize: 10,
                    );
                  }),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  const Text(
                    StringConstants.profileLabel5Txt,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    nonEditableField: false,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  ThemeBtn(
                    btnName: StringConstants.profileSaveBtnTxt,
                    btnAction: () async {
                      if (_profilecontroller.validateProfile()) {
                        try {
                          _profilecontroller.updateProfileData(
                              'dob', _dobController.text);
                          _profilecontroller.updateProfileData(
                              'name', _nameController.text);
                          _profilecontroller.updateProfileData(
                              'gender', _profilecontroller.gender.value);
                          _profilecontroller.updateProfileData(
                              'phone', _phoneController.text);
                          _showSuccessDialog();
                        } catch (e) {
                          print("Error: $e");
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showSuccessDialog() {
  Get.defaultDialog(
    title: 'Success',
    middleText: 'User data updated successfully',
    onConfirm: () {
      Get.back(); // Close the dialog
    },
    textConfirm: 'OK',
    confirmTextColor: ColorConstants.whiteColor,
    buttonColor: ColorConstants.primaryColor,
  );

  void showErrorDialog(String message) {
    Get.defaultDialog(
      title: 'Error',
      middleText: message,
      onConfirm: () {
        Get.back(); // Close the dialog
      },
      textConfirm: 'OK',
      confirmTextColor: ColorConstants.whiteColor,
      buttonColor: ColorConstants.primaryColor,
    );
  }
}

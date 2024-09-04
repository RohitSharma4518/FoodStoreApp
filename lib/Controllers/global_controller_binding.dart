import 'package:foodstore/Modules/Cart/cart_controller.dart';
import 'package:foodstore/Modules/Dashboard/dashboard_controller.dart';
import 'package:foodstore/Modules/MenuDetail/menu_detail_controller.dart';
import 'package:foodstore/Modules/Profile/Controller/profile_controller.dart';
import 'package:foodstore/Modules/Signup/signup_controller.dart';
import 'package:get/get.dart';
import '../Modules/Login/login_controller.dart';

class GlobalControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(MenuDetailController());
    Get.put(HomeController());
    Get.put(
      LoginController(),
    );
    Get.put(SignupController());
  }
}

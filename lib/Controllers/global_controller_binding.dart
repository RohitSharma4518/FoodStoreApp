import 'package:foodstore/Modules/Cart/cart_controller.dart';
import 'package:get/get.dart';
import '../Modules/Login/login_controller.dart';
import 'network_connectivity_controller.dart';

class GlobalControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(
      LoginController(),
    );
    Get.put(
      NetworkConnectivityController(),
    );
  }
}

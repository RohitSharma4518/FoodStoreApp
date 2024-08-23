import 'package:foodstore/Modules/Cart/cart_controller.dart';
import 'package:foodstore/Modules/Signup/signup_controller.dart';
import 'package:foodstore/Modules/Signup/signup_repository.dart';
import 'package:get/get.dart';
import '../Data/Api/api_manager.dart';
import '../Modules/Login/login_controller.dart';
import '../Modules/Login/login_repository.dart';
import 'network_connectivity_controller.dart';

///
/// Initial Controller Binding
///
class GlobalControllerBindings extends Bindings {
  @override
  void dependencies() {
    // dashboard controller initialisation
    // Get.put(
    //   DashboardController(
    //     DashBoardRepository(
    //       ApiManager(),
    //     ),
    //   ),
    // );
    Get.put(SignupController());
    // Get.put(SignupRepository());
    Get.put(CartController());
    // login controller initialisation
    Get.put(
      LoginController(
        LoginRepository(
          ApiManager(),
        ),
      ),
    );

    // login controller initialisation
    Get.put(
      NetworkConnectivityController(),
    );
  }
}

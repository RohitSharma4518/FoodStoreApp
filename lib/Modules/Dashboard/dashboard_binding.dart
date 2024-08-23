import 'package:get/get.dart';
import 'package:foodstore/Modules/Login/login_controller.dart';
import 'package:foodstore/Modules/Login/login_repository.dart';

import '../../Data/Api/api_manager.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    // find logincontroller which is already initialised
    Get.lazyPut<LoginController>(
      () => LoginController(
        LoginRepository(
          ApiManager(),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:foodstore/Modules/Login/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController(this.repository);

  ///
  /// login api call
  login() async {
    await repository.loginAPICall(
      {
        'email': 'test@gmail.com',
        'password': '123456',
      },
    );

    // rest code will write over here (Navigation & User Data Stoarage & Other Logic)
  }
}

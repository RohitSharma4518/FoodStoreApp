import 'package:foodstore/Modules/Cart/emptycart_view.dart';
import 'package:foodstore/Modules/Dashboard/dashboard_view.dart';
import 'package:foodstore/Modules/Dashboard/navbar.dart';
import 'package:foodstore/Modules/ForgotPassword/forgotpswd_view.dart';
import 'package:foodstore/Modules/ForgotPassword/resetpswd_view.dart';
import 'package:foodstore/Modules/Login/login_view.dart';
import 'package:foodstore/Modules/MenuDetail/menu_detail_view.dart';
import 'package:foodstore/Modules/Search/search_view.dart';
import 'package:foodstore/Modules/Setting/setting_view.dart';
import 'package:foodstore/Modules/Signup/signup_view.dart';
import 'package:get/get.dart';
import 'package:foodstore/Routes/app_routes.dart';

import '../Modules/Onboarding/splash_screen.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  static const INITIAL = AppRoutes.splashScreen;

  static final routes = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginView(),
        transition: transition),
    GetPage(
        name: AppRoutes.signupScreen,
        page: () => const SignupView(),
        transition: transition),
    GetPage(
        name: AppRoutes.forgotPswdScreen,
        page: () => const ForgotpswdView(),
        transition: transition),
    GetPage(
        name: AppRoutes.resetPswdScreen,
        page: () => const ResetpswdView(),
        transition: transition),
    GetPage(
        name: AppRoutes.dashboardScreen,
        page: () => const DashboardView(),
        transition: transition),
    GetPage(
        name: AppRoutes.menuDetailScreen,
        page: () => const MenuDetailView(),
        transition: transition),
    GetPage(
        name: AppRoutes.navBarScreen,
        page: () => const NavBar(),
        transition: transition),
    GetPage(
        name: AppRoutes.searchScreen,
        page: () => const SearchView(),
        transition: transition),
    GetPage(
        name: AppRoutes.emptyCartScreen,
        page: () => const EmptyCartView(),
        transition: transition),
    GetPage(
        name: AppRoutes.settingScreen,
        page: () => const SettingView(),
        transition: transition),
  ];
}

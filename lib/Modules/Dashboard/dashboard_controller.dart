// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:foodstore/Modules/Dashboard/dashboard_repository.dart';

// class DashboardController extends GetxController {
//   final DashBoardRepository repository;

//   DashboardController(this.repository);

//   ///
//   /// variable declaration
//   final _searchTextEditingController = TextEditingController();
//   final _dashFieldTextEditingController = TextEditingController();

//   TextEditingController get searchTextEditingController =>
//       _searchTextEditingController;

//   TextEditingController get dashFieldTextEditingController =>
//       _dashFieldTextEditingController;

//   ///
//   /// get dashboard details api call
//   getDashboardDetails() async {
//     await repository.getDashBoardDetails(
//       {
//         'dash_field': dashFieldTextEditingController.text,
//       },
//     );
//   }
// }

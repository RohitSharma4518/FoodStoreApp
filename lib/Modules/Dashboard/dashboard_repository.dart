// // import '../../Data/Api/api_manager.dart';

// // class DashBoardRepository {
// //   final ApiManager apiHelper;
// //   DashBoardRepository(this.apiHelper);

// //   ///
// //   /// get dashboard details api call
// //   Future<void> getDashBoardDetails(Map parameters) async {}
// // }
// import 'package:demo_porject/Modules/Dashboard/Widgets/bottom_nav_bar.dart';
// import 'package:demo_porject/Modules/Dashboard/dashboard_controller.dart';
// import 'package:demo_porject/Modules/Dashboard/Widgets/order_empty.dart';
// import 'package:demo_porject/Modules/Dashboard/Widgets/profile.dart';
// import 'package:demo_porject/Modules/Login/login_view.dart';
// import 'package:demo_porject/Routes/app_routes.dart';
// // import 'package:demo_porject/Routes/app_routes.dart';
// // import 'package:demo_porject/Modules/Dashboard/dashboard_repository.dart';
// import 'package:demo_porject/Utils/Constants/asset_constant.dart';
// import 'package:demo_porject/Utils/Constants/color_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class DashboardView extends GetView<DashboardController> {
//   const DashboardView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final DashboardController dashboardController = Get.put(DashboardController());
//     // final ApiManager apiManager = ApiManager();
//     // final DashBoardRepository repository = DashBoardRepository(apiManager);
//     // final DashboardController dashboardController = Get.put(DashboardController(repository));

//     // throw const Scaffold();
//     return Scaffold(
//       body: Obx(() {
//         // Update the body based on the selected tab index
//         switch (controller.selectedIndex.value) {
//           case 0:
//             return dashboardContent(context);
//           case 1:
//             return OrderEmpty();
//           case 2:
//             return LoginView();
//           default:
//             return const PersonalDetail();
//         }
//       }),
//       bottomNavigationBar: BottomNavBar(
//         selectedIndex: controller.selectedIndex,
//         onItemTapped: controller.onItemTapped,
//       ),
//     );
//   }

//   Widget dashboardContent(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           // width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 3.35,
//           // height: 300,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(AssetConstant.HomeBackgroundImage),
//                 fit: BoxFit.cover),
//           ),

//           child: Padding(
//             padding: const EdgeInsets.only(left: 24, right: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 52,
//                 ),
//                 Row(
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "Your Location",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: ColorConstants.whiteColor),
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Icon(
//                               Icons.arrow_drop_down,
//                               color: ColorConstants.whiteColor,
//                               size: 16,
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_on_outlined,
//                               size: 24,
//                               color: ColorConstants.whiteColor,
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               "New York City",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: ColorConstants.whiteColor),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     const Spacer(),
//                     Row(
//                       children: [
//                         GestureDetector(
//                             onTap: () => Get.toNamed(AppRoutes.searchPage),
//                             child: Image.asset(AssetConstant.SearchImage)),
//                         const SizedBox(
//                           width: 16,
//                         ),
//                         Image.asset(AssetConstant.NotificationImage),
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 Container(
//                   width: 272,
//                   child: const Text(
//                     "Provide the best food for you",
//                     style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstants.whiteColor),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.all(24.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Find by Category",
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: ColorConstants.primaryTextColor),
//               ),
//               Text(
//                 "See All",
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: ColorConstants.primaryButtonColor),
//               )
//             ],
//           ),
//         ),
//         Expanded(
//           child: DefaultTabController(
//             length: 4,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 24.0, left: 24),
//                   child: SizedBox(
//                     width: 100.w,
//                     child: TabBar(
//                       // tabAlignment: TabAlignment.center,
//                       indicator: BoxDecoration(
//                         color: ColorConstants.primaryButtonColor,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       dividerColor: Colors.transparent,
//                       // indicatorColor: Colors.transparent,
//                       // indicatorSize: TabBarIndicatorSize.tab,
//                       labelColor: ColorConstants.whiteColor,
//                       unselectedLabelColor: ColorConstants.secondaryTextColor,
//                       tabs: [
//                         SizedBox(
//                           height: 65,
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetConstant
//                                       .BurgerImage, // Replace with your image path
//                                   width: 24, // Adjust as needed
//                                   height: 24, // Adjust as needed
//                                 ),
//                                 const SizedBox(
//                                   height: 4,
//                                 ),
//                                 const Text(
//                                   'Burger',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetConstant
//                                     .TacoImage, // Replace with your image path
//                                 width: 24, // Adjust as needed
//                                 height: 24, // Adjust as needed
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               const Text(
//                                 'Taco',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetConstant
//                                     .DrinkImage, // Replace with your image path
//                                 width: 24, // Adjust as needed
//                                 height: 24, // Adjust as needed
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               const Text(
//                                 'Drink',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetConstant
//                                     .PizzaImage, // Replace with your image path
//                                 width: 24, // Adjust as needed
//                                 height: 24, // Adjust as needed
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               const Text(
//                                 'Pizza',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       Center(child: content()),
//                       Center(child: content()),
//                       Center(child: content()),
//                       Center(child: content()),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget content() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 24.0, right: 24),
//       child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 28,
//               childAspectRatio: 0.8),
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final item = items[index];
//             return GestureDetector(
//               onTap: () => Get.toNamed(AppRoutes.menuPage),
//               child: Container(
//                 // height: 204,
//                 // width: 153,
//                 decoration: BoxDecoration(
//                   // image: DecorationImage(image: AssetImage(images[index])),
//                   borderRadius: BorderRadius.circular(12),
//                   color: ColorConstants.whiteColor,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Stack(children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image(
//                               image: AssetImage(item['photo']!),
//                             )),
//                       ),
//                       const Positioned(
//                           top: 16,
//                           right: 16,
//                           child:
//                               Image(image: AssetImage(AssetConstant.likeImage)))
//                     ]),
//                     Text(
//                       item['title']!,
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: ColorConstants.primaryTextColor),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.star,
//                             color: ColorConstants.primaryButtonColor, size: 14),
//                         const SizedBox(
//                           width: 4,
//                         ),
//                         Text(item['rating']!),
//                         const SizedBox(
//                           width: 40,
//                         ),
//                         const Icon(
//                           Icons.location_on_outlined,
//                           size: 14,
//                           color: ColorConstants.primaryButtonColor,
//                         ),
//                         Text(item['distance']!),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     Row(
//                       children: [
//                         const SizedBox(
//                           width: 16,
//                         ),
//                         Text(
//                           item['price']!,
//                           style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: ColorConstants.primaryButtonColor),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

// List<Map<String, String>> items = [
//   {
//     'photo': AssetConstant.burger1,
//     'title': 'Ordinary Burgers',
//     'rating': '4.9',
//     'distance': '190m',
//     'price': '\$ 17,230'
//   },
//   {
//     'photo': AssetConstant.burger2,
//     'title': 'Burger With Meat',
//     'rating': '4.9',
//     'distance': '190m',
//     'price': '\$ 17,230'
//   },
//   {
//     'photo': AssetConstant.burger3,
//     'title': 'Burger Veggi',
//     'rating': '4.9',
//     'distance': '190m',
//     'price': '\$ 17,230'
//   },
//   {
//     'photo': AssetConstant.burger4,
//     'title': 'Burger jambo',
//     'rating': '4.9',
//     'distance': '190m',
//     'price': '\$ 17,230'
//   },
//   {
//     'photo': AssetConstant.burger1,
//     'title': 'Ordinary Burgers',
//     'rating': '4.9',
//     'distance': '190m',
//     'price': '\$ 17,230'
//   },
//   {
//     'photo': AssetConstant.burger2,
//     'title': 'Burger With Meat',
//     'rating': '4.9',
//     'distance': '190m',
//     'price': '\$ 17,230'
//   },
// ];

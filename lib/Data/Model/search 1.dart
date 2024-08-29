// import 'package:flutter/material.dart';
// import 'package:food_store/Modules/About/Controller/about_controller.dart';
// import 'package:food_store/Modules/Home/Model/home_model.dart';
// import 'package:food_store/Modules/Search/Controllers/search_controller.dart';
// import 'package:food_store/Routes/app_routes.dart';
// import 'package:food_store/Utils/Constants/asset_constant.dart';
// import 'package:food_store/Utils/Constants/color_constant.dart';
// import 'package:food_store/Utils/Constants/string_constant.dart';
// import 'package:food_store/Utils/Widgets/textWidget/text.dart';
// import 'package:get/get.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:sizer/sizer.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final AboutController aboutController = Get.find<AboutController>();
//   final SearchControllers searchControllers = Get.put(SearchControllers());

//   void _onItemTap(FoodItem item) {
//     aboutController.setSelectedFoodItem(item);
//     Get.toNamed(AppRoutes.aboutScreen);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstants.whiteColor,
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: 6.h,
//           left: 6.w,
//           right: 6.w,
//           bottom: 2.h,
//         ),
//         child: Column(
//           children: [
//             Padding(
//                 padding: EdgeInsets.only(
//                   right: 18.w,
//                 ),
//                 child: const CustomText(
//                   text: StringConstants.searchBoldText,
//                   color: ColorConstants.blackColor,
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                 )),
//             SizedBox(
//               height: 1.h,
//             ),
//             TextField(
//               controller: searchControllers.searchControllers,
//               decoration: InputDecoration(
//                 prefixIcon:
//                     const Icon(Icons.search, color: ColorConstants.blackColor),
//                 suffixIcon: const Icon(Bootstrap.sliders2_vertical,
//                     color: ColorConstants.blackColor),
//                 hintText: StringConstants.searchName,
//                 hintStyle: const TextStyle(
//                   color: ColorConstants.blackColor,
//                   fontSize: 11,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: const BorderSide(
//                     color: ColorConstants.backgroundColor,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: const BorderSide(
//                     color: ColorConstants.backgroundColor,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: const BorderSide(
//                     color: ColorConstants.backgroundColor,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 2.h),
//             Expanded(
//               child: Obx(
//                 () {
//                   print(
//                       'Filtered items: ${searchControllers.searchItem.length}');
//                   if (searchControllers.searchControllers.text.isEmpty) {
//                     return Center(
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Get.toNamed(AppRoutes.emptycartScreen);
//                             },
//                             child: Image.asset(AssetConstant.search),
//                           ),
//                           SizedBox(
//                             height: 3.h,
//                           ),
//                           const CustomText(
//                             text: StringConstants.afetrsearchText,
//                             color: ColorConstants.blackColor,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 6.w,
//                               right: 6.w,
//                             ),
//                             child: const CustomText(
//                               text: StringConstants.searchsmallText,
//                               color: ColorConstants.textColor,
//                               fontSize: 11,
//                               fontWeight: FontWeight.w500,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   } else {
//                     return ListView.builder(
//                       itemCount: searchControllers.searchItem.length,
//                       itemBuilder: (context, index) {
//                         final item = searchControllers.searchItem[index];
//                         return ListTile(
//                           title: Text(item.name),
//                           leading: Image.network(item.img),
//                           // subtitle: Text(item.description),
//                           subtitle: Text('Price : \$ ${item.price}'),
//                           onTap: () => _onItemTap(item),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

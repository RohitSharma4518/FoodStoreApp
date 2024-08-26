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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodstore/Modules/Dashboard/Model/dashboard_data_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var dropdownValue = 'Your Location'.obs;

  void setDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  var foodItemsBurger = <FoodItem>[].obs;

  var foodItemsTaco = <FoodItem>[].obs;

  var foodItemsDrink = <FoodItem>[].obs;

  var foodItemsPizza = <FoodItem>[].obs;

  var tabBarItems = <TabBarItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBurgerItems();
    fetchTacoItems();
    fetchDrinkItems();
    fetchPizzaItems();
    fetchTabBarItems();
  }

  void fetchBurgerItems() async {
    try {
      final QuerySnapshot result =
          await FirebaseFirestore.instance.collection('burgers').get();
      final List<DocumentSnapshot> documents = result.docs;
      foodItemsBurger.value =
          documents.map((doc) => FoodItem.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      // Handle errors here
      print('Error fetching burger items: $e');
    }
  }

  void fetchDrinkItems() async {
    try {
      final QuerySnapshot result =
          await FirebaseFirestore.instance.collection('drinks').get();
      final List<DocumentSnapshot> documents = result.docs;
      foodItemsDrink.value =
          documents.map((doc) => FoodItem.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      // Handle errors here
      print('Error fetching drinks items: $e');
    }
  }

  void fetchPizzaItems() async {
    try {
      final QuerySnapshot result =
          await FirebaseFirestore.instance.collection('pizzas').get();
      final List<DocumentSnapshot> documents = result.docs;
      foodItemsPizza.value =
          documents.map((doc) => FoodItem.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      // Handle errors here
      print('Error fetching pizzas items: $e');
    }
  }

  void fetchTacoItems() async {
    try {
      final QuerySnapshot result =
          await FirebaseFirestore.instance.collection('tacos').get();
      final List<DocumentSnapshot> documents = result.docs;
      foodItemsTaco.value =
          documents.map((doc) => FoodItem.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      // Handle errors here
      print('Error fetching tacos items: $e');
    }
  }

  void fetchTabBarItems() async {
    try {
      final QuerySnapshot result =
          await FirebaseFirestore.instance.collection('categories').get();
      final List<DocumentSnapshot> documents = result.docs;
      tabBarItems.value =
          documents.map((doc) => TabBarItem.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      // Handle errors here
      print('Error fetching tacos items: $e');
    }
  }
}

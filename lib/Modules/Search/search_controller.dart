import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Dashboard/Model/dashboard_model.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  RxList<FoodItem> allFoodItems = <FoodItem>[].obs;
  RxList<FoodItem> searchItem = <FoodItem>[].obs;
  final TextEditingController searchControllers = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllFoodItems();
    searchControllers.addListener(_filterFoodItems);
  }

  void fetchAllFoodItems() async {
    try {
      final QuerySnapshot result =
          await FirebaseFirestore.instance.collection('fooditems').get();
      final List<DocumentSnapshot> documents = result.docs;
      allFoodItems.value =
          documents.map((doc) => FoodItem.fromDocumentSnapshot(doc)).toList();
      searchItem.value = allFoodItems;
    } catch (e) {
      print('Error fetching food items: $e');
    }
  }

  void _filterFoodItems() {
    final query = searchControllers.text.toLowerCase();
    if (query.isEmpty) {
      searchItem.value = [];
    } else {
      searchItem.value = allFoodItems
          .where((item) => item.name.toLowerCase().contains(query))
          .toList();
    }
  }

  @override
  void onClose() {
    searchControllers.dispose();
    super.onClose();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodstore/Modules/Dashboard/Model/dashboard_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var dropdownValue = 'Your Location'.obs;

  void setDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  var foodItems = <FoodItem>[].obs;
  var tabBarItems = <TabBarItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTabBarItems();
    fetchFoodItemsByCategory('ATgkfbMf93ik00RYSF08');
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
      print('Error fetching TabBar items: $e');
    }
  }

  void fetchFoodItemsByCategory(String categoryId) async {
    try {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('fooditems')
          .where('category_id', isEqualTo: categoryId)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      foodItems.value =
          documents.map((doc) => FoodItem.fromDocumentSnapshot(doc)).toList();
      print('Fetched ${foodItems.length} items for category: $categoryId');
    } catch (e) {
      // Handle errors here
      print('Error fetching food items: $e');
    }
  }
}

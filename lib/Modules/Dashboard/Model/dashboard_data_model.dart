import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItem {
  final String name;
  final String img;
  final String rating;
  final String price;
  // final double price;
  final String distance;
  final String description;
  // final String count;

  FoodItem({
    required this.name,
    required this.img,
    required this.rating,
    required this.price,
    required this.distance,
    this.description = '',
    // this.count = '1',
  });

  factory FoodItem.fromDocumentSnapshot(DocumentSnapshot doc) {
    String priceString = doc['price'] ?? '0';
    double price = 0;
    try {
      price = double.parse(priceString.replaceAll(',', '.'));
    } catch (e) {
      print('Error parsing price: $e');
    }

    return FoodItem(
      name: doc['name'],
      img: doc['img'],
      rating: doc['rating'],
      price: doc['price'],
      // price: price,
      distance: doc['distance'],
      description: doc['description'],
      // count: doc['count'],
      // count: doc['id'] ?? '1',
    );
  }
}

class TabBarItem {
  final String title;
  final String img;

  TabBarItem({
    required this.title,
    required this.img,
  });

  factory TabBarItem.fromDocumentSnapshot(DocumentSnapshot doc) {
    return TabBarItem(
      title: doc['name'],
      img: doc['img'],
    );
  }
}

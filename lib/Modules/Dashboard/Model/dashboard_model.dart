import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItem {
  final String name;
  final String img;
  final double price;
  final String rating;
  final String description;
  final String category_id;
  final String distance;

  FoodItem({
    required this.name,
    required this.img,
    required this.price,
    required this.rating,
    required this.description,
    required this.distance,
    required this.category_id,
  });

  factory FoodItem.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FoodItem(
      name: data['name'],
      img: data['img'],
      price: (data['price'] is String)
          ? double.tryParse(data['price'].replaceAll(',', '.')) ?? 0.0
          : data['price']?.toDouble() ?? 0.0,
      rating: data['rating'],
      description: data['description'],
      distance: data['distance'],
      category_id: data['category_id'],
    );
  }
}

class TabBarItem {
  final String id;
  final String title;
  final String img;

  TabBarItem({
    required this.id,
    required this.title,
    required this.img,
  });

  factory TabBarItem.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TabBarItem(
      id: doc.id,
      title: data['name'],
      img: data['img'],
    );
  }
}

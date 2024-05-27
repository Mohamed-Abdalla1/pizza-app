import 'package:pizza_repository/src/entities/marcos.entity.dart';

import '../models/macros.dart';

class PizzaEntity {
 final String? pizzaId;
 final String? name;
 final String? image;
  bool isVeg;
  int spicy;
 final String? desc;
  int price;
  int discount;
  Macros macros;
  PizzaEntity({
    required this.pizzaId,
    required this.name,
    required this.image,
    required this.isVeg,
    required this.spicy,
    required this.price,
    required this.discount,
    required this.desc,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'pizzaId': pizzaId,
      'name': name,
      'image': image,
      'isVeg': isVeg,
      'spicy': spicy,
      'price': price,
      'discount': discount,
      'desc': desc,
      'macros': macros.toEntity().toDocument(),
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
      pizzaId: doc['pizzaId'],
      name: doc['name'],
      image: doc['image'],
      isVeg: doc['isVeg'],
      spicy: doc['spicy'],
      price: doc['price'],
      discount: doc['discount'],
      desc: doc['desc'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}

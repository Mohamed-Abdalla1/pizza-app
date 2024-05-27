

import '../entities/entity.dart';
import 'models.dart';

class PizzaModel {
final  String? pizzaId;
final  String? name;
final  String? image;
final  bool isVeg;
final  int spicy;
final  String? desc;
 final int price;
 final int discount;
final  Macros macros;
  PizzaModel({
   required  this.pizzaId,
  required   this.name,
    required this.image,
    required this.isVeg,
    required this.spicy,
    required this.price,
    required this.discount,
    required this.desc,
    required this.macros,
  });

  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      name: name,
      image: image,
      isVeg: isVeg,
      spicy: spicy,
      price: price,
      discount: discount,
      desc: desc,
      macros: macros,
    );
  }

  static PizzaModel fromEntity(PizzaEntity pizzaEntity) {
    return PizzaModel(
      pizzaId: pizzaEntity.pizzaId,
      name: pizzaEntity.name,
      image: pizzaEntity.image,
      isVeg: pizzaEntity.isVeg,
      spicy: pizzaEntity.spicy,
      price: pizzaEntity.price,
      discount: pizzaEntity.discount,
      desc: pizzaEntity.desc,
      macros: pizzaEntity.macros,

    );
  }

  
}



import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/src/entities/entity.dart';
import 'package:pizza_repository/src/models/models.dart';

import 'pizza_repo.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  @override
  Future<List<PizzaModel>> getPizzas() async {
    try {
      return await pizzaCollection.get().then((value) => value.docs
          .map((value) =>
              PizzaModel.fromEntity(PizzaEntity.fromDocument(value.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

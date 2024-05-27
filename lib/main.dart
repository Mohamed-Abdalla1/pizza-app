import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/app.dart';
import 'package:user_repository/user_repository.dart';

import 'Simple_bloc_observer.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(
    userRepository: FirebaseUserRepo(),
  ));
}

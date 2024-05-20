import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/authentication/authentication_bloc.dart';
import 'package:pizza/screens/auth/views/welcome_view.dart';
import 'package:pizza/screens/home/views/home_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pizza app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            background: Colors.grey.shade200,
            onBackground: Colors.black,
            primary: Colors.blue,
            onPrimary: Colors.white),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationSuccess) {
            return const HomeView();
          } else {
            return const WelcomeView();
          }
        },
      ),
    );
  }
}

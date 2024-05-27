import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/authentication/authentication_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_in/sign_in_bloc.dart';
import 'package:pizza/screens/auth/views/welcome_view.dart';
import 'package:pizza/screens/home/blocs/get_pizzas/get_pizzas_bloc.dart';
import 'package:pizza/screens/home/views/home_view.dart';
import 'package:pizza_repository/pizza_repository.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pizza app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Color.fromRGBO(206, 147, 216, 1),
            onPrimary: Colors.black,
            secondary: Color.fromRGBO(244, 143, 177, 1),
            onSecondary: Colors.white,
            tertiary: Color.fromRGBO(255, 204, 128, 1),
            error: Colors.red,
            outline: Color(0xFF424242)),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                      context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider(
                  create: (context) => GetPizzasBloc(
                    FirebasePizzaRepo()
                  )..add(GetPizzas()),
                ),
              ],
              child: HomeView(),
            );
          } else {
            return WelcomeView();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_in/sign_in_bloc.dart';
import 'package:pizza/screens/auth/views/welcome_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const WelcomeView(),
                  ),
                );
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body: Container(),
    );
  }
}

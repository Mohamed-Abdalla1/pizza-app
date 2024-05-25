import 'package:flutter/cupertino.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/8.png',
              scale: 16,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'PIZZA',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
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

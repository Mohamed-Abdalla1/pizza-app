import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/authentication/authentication_bloc.dart';
import 'package:pizza/components/custom_align.dart';
import 'package:pizza/screens/auth/blocs/sign_in/sign_in_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_up/sign_up_bloc.dart';
import 'package:pizza/screens/auth/views/sign_in_view.dart';
import 'package:pizza/screens/auth/views/sign_up_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CustomAlign(
                alignment: const AlignmentDirectional(20, -1.2),
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              CustomAlign(
                alignment: const AlignmentDirectional(-2.7, -1.2),
                height: MediaQuery.of(context).size.width / 1.3,
                width: MediaQuery.of(context).size.width / 1.3,
                color: Theme.of(context).colorScheme.secondary,
              ),
              CustomAlign(
                alignment: const AlignmentDirectional(2.7, -1.2),
                height: MediaQuery.of(context).size.width / 1.3,
                width: MediaQuery.of(context).size.width / 1.3,
                color: Theme.of(context).colorScheme.primary,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: TabBar(
                            controller: tabController,
                            unselectedLabelColor: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5),
                            labelColor:
                                Theme.of(context).colorScheme.onBackground,
                            tabs: const [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              BlocProvider<SignInBloc>(
                                create: (context) => SignInBloc(
                                     context
                                        .read<AuthenticationBloc>()
                                        .userRepository),
                                child: SignInView(),
                              ),
                              BlocProvider<SignUpBloc>(
                                  create: (context) => SignUpBloc(
                                      context
                                          .read<AuthenticationBloc>()
                                          .userRepository),
                                  child: SignUpView()),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

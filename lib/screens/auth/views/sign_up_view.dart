import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/components/custom_textField.dart';
import 'package:pizza/screens/auth/blocs/sign_up/sign_up_bloc.dart';
import 'package:pizza/screens/home/blocs/get_pizzas/get_pizzas_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:user_repository/user_repository.dart';

import '../../home/views/home_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  bool obscuredText = true;
  bool signInRequired = false;
  String? _errorMsg;
  IconData iconPassword = CupertinoIcons.eye_fill;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpsuccess) {
          setState(() {
            signInRequired = false;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => GetPizzasBloc(FirebasePizzaRepo()),
                  child: const HomeView(),
                ),
              ),
            );
          });
        } else if (state is SignUpLoading) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextfield(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(CupertinoIcons.mail_solid),
                  obscureText: false,
                  hintText: 'Email',
                  errorText: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please fill in this field';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                        .hasMatch(val)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextfield(
                  controller: passwordController,
                  prefixIcon: const Icon(CupertinoIcons.lock_fill),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscuredText,
                  hintText: 'Password',
                  onChanged: (val) {
                    if (val.contains(RegExp(r'[A-Z]'))) {
                      setState(() {
                        containsUpperCase = true;
                      });
                    } else {
                      setState(() {
                        containsUpperCase = false;
                      });
                    }
                    if (val.contains(RegExp(r'[a-z]'))) {
                      setState(() {
                        containsLowerCase = true;
                      });
                    } else {
                      setState(() {
                        containsLowerCase = false;
                      });
                    }
                    if (val.contains(RegExp(r'[0-9]'))) {
                      setState(() {
                        containsNumber = true;
                      });
                    } else {
                      setState(() {
                        containsNumber = false;
                      });
                    }
                    if (val.contains(RegExp(
                        r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
                      setState(() {
                        containsSpecialChar = true;
                      });
                    } else {
                      setState(() {
                        containsSpecialChar = false;
                      });
                    }
                    if (val.length >= 8) {
                      setState(() {
                        contains8Length = true;
                      });
                    } else {
                      setState(() {
                        contains8Length = false;
                      });
                    }
                    return null;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please fill in this field';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                        .hasMatch(val)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscuredText = !obscuredText;
                      if (obscuredText) {
                        setState(() {
                          iconPassword = CupertinoIcons.eye_fill;
                        });
                      } else {
                        setState(() {
                          iconPassword = CupertinoIcons.eye_slash_fill;
                        });
                      }
                    },
                    icon: Icon(iconPassword),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '⚈ 1 Upper character',
                        style: TextStyle(
                            color: containsUpperCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        '⚈ 1 Lower character',
                        style: TextStyle(
                            color: containsLowerCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        '⚈ 1 Number ',
                        style: TextStyle(
                            color: containsNumber
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '⚈ 1  Special character',
                        style: TextStyle(
                            color: containsSpecialChar
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        '⚈ 8 minimum character',
                        style: TextStyle(
                            color: contains8Length
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextfield(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(CupertinoIcons.person_fill),
                  obscureText: false,
                  hintText: 'Name',
                  errorText: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (val.length > 30) {
                      return 'Name too long';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              !signInRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            MyUser myUser = MyUser.empty;
                            myUser.name = nameController.text;
                            myUser.email = emailController.text;
                            setState(() {
                              context.read<SignUpBloc>().add(SignUpRequired(
                                    myUser,
                                    passwordController.text,
                                  ));
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            )),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

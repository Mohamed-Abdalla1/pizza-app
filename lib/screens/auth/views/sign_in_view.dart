import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza/components/custom_textField.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool obscuredText = true;
  bool signInRequired = false;
  String? _errorMsg;
  IconData iconPassword = CupertinoIcons.eye_fill;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: CustomTextfield(
              controller: passwordController,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscuredText,
              hintText: 'Password',
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
            height: 20,
          ),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    style: TextButton.styleFrom(
                        elevation: 3.0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        )),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text(
                        'Sign In',
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
    );
  }
}

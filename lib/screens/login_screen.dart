import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';
import 'package:food_ordering_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: Column(
        children: [
          const SizedBox(height: 150),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/logo.png',
              width: 250,
              height: 100,
            ),
          ),
          const SizedBox(height:15),
          Form(
            child: Column(
              children: [
                MyTextField(
                  validator: (val) {
                    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~"
                                r"]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                        ? null
                        : "Enter valid email.";
                  },
                  controller: emailTextController,
                  hint: 'Email',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  validator: (val) {
                    return val.length < 7 || val.isEmpty
                        ? "Incorrect password."
                        : null;
                  },
                  controller: passwordTextController,
                  hint: 'Password',
                  isObscureText: true,
                  icon: Icons.lock,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

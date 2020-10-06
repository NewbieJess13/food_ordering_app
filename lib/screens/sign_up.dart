import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';
import 'package:food_ordering_app/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullNameTextController = new TextEditingController();
  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();
  TextEditingController passwordReTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.scaffold,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const SizedBox(height: 100),
                  Text(
                    'Sign up Now',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        MyTextField(
                          controller: fullNameTextController,
                          hint: 'Fullname*',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: emailTextController,
                          hint: 'Email*',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: passwordTextController,
                          hint: 'Password*',
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: passwordReTextController,
                          hint: 'Re-type password*',
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 30),
                        ButtonLogin(
                          content: Text('Sign-Up'),
                          splashColor: Colors.black45,
                          textColor: Colors.white,
                          backgroundColor: Palette.loginButtonColor,
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}

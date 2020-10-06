import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering_app/config/config.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:food_ordering_app/services/auth.dart';
import 'package:food_ordering_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  _signMeIn() {
    if (formKey.currentState.validate()) {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~"
                  r"]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(emailTextController.text) &&
          passwordTextController.text.length >= 7) {
        AuthMethod()
            .userSignIn(emailTextController.text, passwordTextController.text)
            .then((value) {
          setState(() => isLoading = false);
          if (value = null) {
            scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Row(
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Incorrect email or password.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ));
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Please enter a valid email or password.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                Text(
                  'foodmonkey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: emailTextController,
                        hint: 'Email',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        controller: passwordTextController,
                        hint: 'Password',
                        isPassword: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => print('forgot'),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      ButtonLogin(
                        content: isLoading
                            ? SpinKitRing(
                                color: Colors.white,
                                size: 30,
                                lineWidth: 3.0,
                              )
                            : Text(
                                'Sign-in',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                        splashColor: Colors.black45,
                        textColor: Colors.white,
                        backgroundColor: Palette.loginButtonColor,
                        onTap: () {
                          setState(() {
                            isLoading = true;
                          });
                          _signMeIn();
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Or connect with',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AuthMethod().signInWithGoogle().then((result) {});
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent),
                                child: Image.asset('images/google-logo.png')),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => print('facebook'),
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    'images/facebook-logo-2019.png')),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

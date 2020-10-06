import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/user.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    return (_user != null) ? NavScreen() : LoginScreen();
  }
}
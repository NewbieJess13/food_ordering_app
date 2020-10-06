import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/user.dart';
import 'package:food_ordering_app/root.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_ordering_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthMethod().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ay Bilhe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Root(),
      ),
    );
  }
}

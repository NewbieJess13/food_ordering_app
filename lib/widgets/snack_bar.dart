import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';


class SnackBarKo extends StatelessWidget {
  final String message;

  const SnackBarKo({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SnackBar(
        backgroundColor: Palette.backgroundColor,
        elevation: 8,
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 25,
            ),
            SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

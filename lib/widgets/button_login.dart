import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';

class ButtonLogin extends StatelessWidget {
  final Widget content;
  final Color splashColor;
  final Color textColor;
  final Color backgroundColor;
  final Function onTap;

  const ButtonLogin({
    Key key,
    @required this.content,
    @required this.splashColor,
    @required this.textColor,
    @required this.backgroundColor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: splashColor,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45.withOpacity(0.3),
                spreadRadius: 6,
                blurRadius: 5,
                offset: Offset(1, 4),
              )
            ]),
        height: 50,
        child: Center(child: content),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hint;
  final IconData icon;
  const MyTextField({
    Key key,
    @required this.controller,
    this.isPassword = false,
    this.hint,
    this.icon,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isObscure = true;
  togglePass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Row(
        children: [
          Icon(widget.icon, size: 25, color: Palette.iconColor),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextFormField(
              obscureText: widget.isPassword ? isObscure : false,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                labelText: widget.hint,
                labelStyle: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w800),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          widget.isPassword
              ? IconButton(
                  onPressed: () {
                    togglePass();
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    size: 25,
                    color: Colors.black45,
                  ))
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

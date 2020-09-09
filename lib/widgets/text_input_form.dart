import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';
class MyTextField extends StatelessWidget {
  final Function validator;
  final TextEditingController controller;
  final bool isObscureText;
  final String hint;
  final IconData icon;
  const MyTextField({
    Key key,
    this.validator,
    @required this.controller,
    this.isObscureText = false,
    this.hint,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Row(
        children: [
          Icon(icon,size: 25,color: Palette.iconColor),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextFormField(
              validator: validator,
              obscureText: isObscureText,
              controller: controller,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                labelText: hint,
                labelStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w800),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

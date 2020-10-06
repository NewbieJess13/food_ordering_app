import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  const SearchBar({
    Key key,
    @required this.controller,
    this.hint,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Palette.iconColor,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () => print('filter'),
            icon: Icon(
              Icons.filter_list,
              size: 25,
              color: Palette.iconColor,
            ),
          ),
        ],
      ),
    );
  }
}

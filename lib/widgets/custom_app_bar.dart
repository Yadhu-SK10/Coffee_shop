import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;   // The left side item
  final Widget? trailing;  // The right side item

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 26, right: 26, bottom: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          SizedBox(
            width: 70,
            child: Align(
              alignment: Alignment.centerLeft,
              child: leading ?? const SizedBox(),
            ),
          ),


          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF1F2024),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // RIGHT SLOT
          SizedBox(
            width: 70,
            child: Align(
              alignment: Alignment.centerRight,
              child: trailing ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
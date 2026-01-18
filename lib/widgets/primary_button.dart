import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48, // 🔹 from figma
        padding: const EdgeInsets.fromLTRB(
          16, // left
          12, // top
          16, // right
          12, // bottom
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF006FFD), // 🔹 figma color
          borderRadius: BorderRadius.circular(12), // 🔹 figma radius
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

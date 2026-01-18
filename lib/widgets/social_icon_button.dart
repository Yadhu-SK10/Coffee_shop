import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconButton extends StatelessWidget {
  final Color backgroundColor;
  final String iconPath;
  final VoidCallback onTap;

  const SocialIconButton({
    super.key,
    required this.backgroundColor,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40, // 🔹 figma
        height: 40, // 🔹 figma
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: SizedBox(
          width: 38,  // 🔥 slightly larger than before
          height: 38,
          child: SvgPicture.asset(
            iconPath,
            fit: BoxFit.contain, // 🔑 important
          ),
        ),
      ),
    );
  }
}

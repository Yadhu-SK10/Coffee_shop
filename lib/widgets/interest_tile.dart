import 'package:flutter/material.dart';

class InterestTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestTile({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEAF2FF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF006FFD) : const Color(0xFFD6D6D6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            if (isSelected) const Icon(Icons.check, size: 18, color: Color(0xFF006FFD)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final ValueChanged<int> onDotTap;

  const OnboardingDots({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    required this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
            (index) => GestureDetector(
          onTap: () => onDotTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(right: 6),
            width: currentIndex == index ? 10 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? const Color(0xFF006FFD)
                  : const Color(0xFFD0D0D0),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}

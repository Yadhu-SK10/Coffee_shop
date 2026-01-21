import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // 0.0 → 1.0

  const ProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            //  Background bar
            Container(
              width: double.infinity,
              height: 8,
              color: const Color(0xFFE5E5E5),
            ),

            //  Animated progress fill
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              width: 327 * progress.clamp(0.0, 1.0),
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF006FFD),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

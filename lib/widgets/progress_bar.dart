import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // value between 0.0 and 1.0

  const ProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Container(color: const Color(0xFFE5E5E5)),

            // Filled part
            FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(color: const Color(0xFF006FFD)),
            ),
          ],
        ),
      ),
    );
  }
}

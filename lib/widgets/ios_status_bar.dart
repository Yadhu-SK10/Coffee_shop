import 'package:flutter/material.dart';

class IOSStatusBar extends StatelessWidget {
  const IOSStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44, // 🔹 iOS status bar height
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Time
            const Text(
              "9:41",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            // Right icons
            Row(
              children: const [
                Icon(Icons.signal_cellular_alt, size: 16),
                SizedBox(width: 4),
                Icon(Icons.wifi, size: 16),
                SizedBox(width: 4),
                Icon(Icons.battery_full, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

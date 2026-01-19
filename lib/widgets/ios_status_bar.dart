import 'package:flutter/material.dart';

class IOSStatusBar extends StatelessWidget {
  const IOSStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("9:41", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),

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

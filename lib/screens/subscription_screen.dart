import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/progress_bar.dart';
import 'package:coffee_shop/widgets/interest_tile.dart';
import 'package:coffee_shop/widgets/primary_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final List<String> interests = [
    "User Interface",
    "User Experience",
    "User Research",
    "UX Writing",
    "User Testing",
    "Service Design",
    "Strategy",
    "Design Systems",
  ];

  late List<bool> selected;

  @override
  void initState() {
    super.initState();
    selected = List<bool>.filled(interests.length, false);
  }

  double get progress {
    final selectedCount = selected.where((e) => e).length;
    return selectedCount / interests.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Center(
        child: Container(
          width: 375,
          height: 812,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 68),

              Center(child: ProgressBar(progress: progress)),

              const SizedBox(height: 41),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Personalise your experience",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, height: 1.15),
                ),
              ),

              const SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text("Choose your interests.", style: TextStyle(fontSize: 14, color: Color(0xFF8E8E8E))),
              ),

              const SizedBox(height: 41),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: List.generate(
                      interests.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InterestTile(
                          text: interests[index],
                          isSelected: selected[index],
                          onTap: () {
                            setState(() {
                              selected[index] = !selected[index];
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Center(
                  child: SizedBox(
                    width: 327,
                    height: 48,
                    child: PrimaryButton(
                      text: 'Next',
                      onTap: () {
                        print('subscription set');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

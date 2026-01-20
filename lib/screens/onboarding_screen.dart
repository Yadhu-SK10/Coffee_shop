import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/primary_button.dart';
import 'package:coffee_shop/screens/subscription_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
    "https://images.unsplash.com/photo-1498050108023-c5249f4df085",
    "https://images.unsplash.com/photo-1557804506-669a67965ba0",
  ];

  void _handleSwipe(DragEndDetails details) {
    final velocity = details.primaryVelocity;
    if (velocity == null) return;

    setState(() {
      if (velocity < 0 && _currentIndex < imageUrls.length - 1) {
        _currentIndex++;
      } else if (velocity > 0 && _currentIndex > 0) {
        _currentIndex--;
      }
    });
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
              SizedBox(
                width: 375,
                height: 506,
                child: GestureDetector(
                  onHorizontalDragEnd: _handleSwipe,
                  child: Image.network(imageUrls[_currentIndex], fit: BoxFit.cover),
                ),
              ),

              const SizedBox(height: 32),

              //  DOT INDICATOR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(imageUrls.length, (index) => _buildDot(index)),
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Create a prototype in just a few minutes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        height: 1.1,
                        letterSpacing: 0.1,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Enjoy these pre-made components and worry only "
                      "about creating the best product ever.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8E8E8E),
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 44),

              Center(
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: PrimaryButton(
                    text: 'Next',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SubscriptionScreen()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  DOT WIDGET
  Widget _buildDot(int index) {
    final bool isActive = _currentIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 6),
      width: isActive ? 10 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF006FFD) : const Color(0xFFD0D0D0),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

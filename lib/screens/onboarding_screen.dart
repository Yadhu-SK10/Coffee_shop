import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/primary_button.dart';
import 'package:coffee_shop/screens/subscription_screen.dart';
import 'package:coffee_shop/widgets/onboarding_dots.dart';
import 'package:coffee_shop/widgets/overlay_back_button.dart';

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
      body: Stack(
      children:[
        Center(
        child: Container(
          width: 375,
          height: 812,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  IMAGE
              SizedBox(
                width: 375,
                height: 506,
                child: GestureDetector(
                  onHorizontalDragEnd: _handleSwipe,
                  child: Image.network(
                    imageUrls[_currentIndex],
                    fit: BoxFit.cover,

                    //  LOADING BUILDER
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Container(
                        color: const Color(0xFFF2F2F2),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFF006FFD),
                          ),
                        ),
                      );
                    },

                    // FRAME BUILDER
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) return child;

                      return AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: child,
                      );
                    },

                    //  ERROR BUILDER
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFF2F2F2),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            size: 40,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      );
                    },
                  ),

                ),
              ),

              const SizedBox(height: 32),

              //  DOT INDICATOR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: OnboardingDots(
                  currentIndex: _currentIndex,
                  itemCount: imageUrls.length,
                  onDotTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
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
        const OverlayBackButton(),
    ],

    ), );
  }
}

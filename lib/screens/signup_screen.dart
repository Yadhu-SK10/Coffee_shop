import 'package:coffee_shop/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/ios_status_bar.dart';
import 'package:coffee_shop/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/widgets/primary_button.dart';
import 'package:coffee_shop/screens/onboarding_screen.dart';
import 'package:coffee_shop/widgets/overlay_back_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF), // desktop background
      body: Stack (
      children: [
        Center(
        child: Container(
          width: 375,
          height: 812,
          color: Colors.white,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const IOSStatusBar(),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF1F2024)),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Create an account to get started",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF71727A)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
                        ),

                        const SizedBox(height: 8),

                        const CustomTextField(hint: "Name"),

                        const SizedBox(height: 24),

                        const Text(
                          "Email Address",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
                        ),

                        const SizedBox(height: 8),

                        const CustomTextField(hint: "name@email.com"),

                        const SizedBox(height: 24),

                        // Password label
                        const Text(
                          "Password",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
                        ),

                        const SizedBox(height: 8),

                        const CustomTextField(hint: "Create a password", isPassword: true),

                        const SizedBox(height: 24),

                        const CustomTextField(hint: "Confirm password", isPassword: true),

                        const SizedBox(height: 24),

                        Consumer<SignupProvider>(
                          builder: (context, provider, _) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Checkbox
                                GestureDetector(
                                  onTap: provider.toggleTerms,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: provider.isTermsAccepted
                                            ? const Color(0xFF006FFD)
                                            : const Color(0xFFBDBDBD),
                                      ),
                                      color: provider.isTermsAccepted ? const Color(0xFF006FFD) : Colors.transparent,
                                    ),
                                    child: provider.isTermsAccepted
                                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                                        : null,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Terms text
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
                                      children: [
                                        TextSpan(text: "I've read and agree with the "),
                                        TextSpan(
                                          text: "Terms and Conditions",
                                          style: TextStyle(color: Color(0xFF006FFD), fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(text: " and the "),
                                        TextSpan(
                                          text: "Privacy Policy",
                                          style: TextStyle(color: Color(0xFF006FFD), fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(text: "."),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 24),

                        PrimaryButton(
                          text: "Sign up",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
        const OverlayBackButton(),
      ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:coffee_shop/widgets/primary_button.dart';
import 'package:coffee_shop/widgets/custom_text_field.dart';
import 'package:coffee_shop/screens/signup_screen.dart';
import 'package:coffee_shop/widgets/social_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/providers/signup_provider.dart';
import 'package:coffee_shop/screens/onboarding_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 312,
                child: Image.asset('assets/images/login_header.png', fit: BoxFit.cover, alignment: Alignment.center),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF000000),
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 24),

                    const CustomTextField(hint: "Email Address"),

                    const SizedBox(height: 16),

                    const CustomTextField(hint: "Password", isPassword: true),

                    const SizedBox(height: 12),

                    const Text(
                      "Forgot password?",
                      style: TextStyle(color: Color(0xFF006FFD), fontSize: 12, fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 24),

                    PrimaryButton(
                      text: "Login",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
                      },
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member? ",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF9E9E9E)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChangeNotifierProvider(
                                  create: (_) => SignupProvider(),
                                  child: const SignupScreen(),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Register now",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF006FFD)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(thickness: 0.5, color: Color(0xFFD4D6DD)),
                    const SizedBox(height: 16),
                    const Text(
                      "Or continue with",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF71727A)),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIconButton(
                          backgroundColor: const Color(0xFFED3241),
                          iconPath: 'assets/icons/google.svg',
                          onTap: () {
                            print("Google login tapped");
                          },
                        ),
                        const SizedBox(width: 16),
                        SocialIconButton(
                          backgroundColor: Colors.black,
                          iconPath: 'assets/icons/apple.svg',
                          onTap: () {
                            print("Apple login tapped");
                          },
                        ),
                        const SizedBox(width: 16),
                        SocialIconButton(
                          backgroundColor: const Color(0xFF1877F2),
                          iconPath: 'assets/icons/facebook.svg',
                          onTap: () {
                            print("Facebook login tapped");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

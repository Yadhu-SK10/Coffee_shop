import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;

  const CustomTextField({super.key, required this.hint, this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Controls password visibility
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hint,

          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9E9E9E)),

          // Border when not focused
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),

          // Border when focused (blue)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF006FFD), width: 1.5),
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

          // 🔥 Password eye icon (only if password field)
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: const Color(0xFF9E9E9E),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

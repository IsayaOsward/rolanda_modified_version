import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Icon prefixIcon;
  final bool obscureText;
  final Function(String?) validator;
  final VoidCallback? suffixIconOnPressed;
  final Icon? suffixIcon;

  const CustomTextFormField({
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
    required this.validator,
    this.suffixIconOnPressed,
    this.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: GoogleFonts.poppins(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIconOnPressed != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: suffixIconOnPressed,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      validator: (value) => validator(value),
    );
  }
}

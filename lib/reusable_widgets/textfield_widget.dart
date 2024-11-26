import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Icon? prefixIcon;
  final bool obscureText;
  final Function(String?) validator;
  final VoidCallback? suffixIconOnPressed;
  final Icon? suffixIcon;

  const CustomTextFormField({
    required this.controller,
    required this.label,
    this.prefixIcon,
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
      obscuringCharacter: "*",
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
        contentPadding: EdgeInsets.symmetric(
            vertical: Dimensions.height15, horizontal: Dimensions.width15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      validator: (value) => validator(value),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? lable;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.lable,
      this.prefixIcon,
      this.sufixIcon,});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _error;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        if (value.contains("@") == false) {
          setState(() {
            _error = "Should have @ symbol";
          });
        } else {
          setState(() {
            _error = null;
          });
        }
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          hintText: widget.hintText,
          errorText: _error,
          prefix: widget.prefixIcon,
          suffixIcon: widget.sufixIcon,
          isDense: true,
          errorMaxLines: 1,
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

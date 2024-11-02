import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String? name;
  final VoidCallback? onPressed;
  const SubmitButton({super.key, this.onPressed,this.name});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.primary, colorScheme.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onPressed,
          splashColor: colorScheme.secondary.withOpacity(0.2),
          child: Center(
            child: Text(
              name!,
              style: TextStyle(
                color: colorScheme.onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

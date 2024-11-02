import 'package:flutter/material.dart';

class CustomWakalaContainer extends StatelessWidget {
  final String imagePath;

  const CustomWakalaContainer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10), // Add padding if needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFEDF1F4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space items evenly
        children: [
          Image.asset(
              imagePath, // Display the image using the provided path
              width: 170,  // Set width if needed
              height: 70, // Set height if needed
              fit: BoxFit.fitHeight
          ),
          const SizedBox(width: 10), // Spacing between image and ClipOval
          ClipOval(
            child: Container(
              color: Colors.grey[300],
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}

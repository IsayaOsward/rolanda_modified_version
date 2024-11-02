import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final Widget icon;
  final String text;
  const ProfileDetail({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton.outlined(
        onPressed: () {},
        icon: icon,
      ),
      title: Text(
        text,
      ),
    );
  }
}

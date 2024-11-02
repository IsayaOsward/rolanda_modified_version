import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/reusable_widgets/app_text_styles.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeaderText({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.title,
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

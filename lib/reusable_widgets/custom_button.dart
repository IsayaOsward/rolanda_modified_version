import 'package:flutter/material.dart';

enum Buttontype { elevatedButton, outlinedButton, iconButton, textButton }

enum ButtonColor { yellow, grey }

class CustomButton extends StatelessWidget {
  final Buttontype type;
  final String text;
  final Icon? icon;
  final VoidCallback onPressed;
  final bool isBlock;
  final ButtonColor color;
  final bool isActive;
  final bool isOutlined;
  final ButtonStyle? style;

  const CustomButton(
      {super.key,
      required this.type,
      this.text = "",
      this.icon,
      required this.onPressed,
      this.isBlock = false,
      this.color = ButtonColor.grey,
      this.isActive = true,
      this.isOutlined = false,
      this.style});

  @override
  Widget build(BuildContext context) {
    Widget? actualButton;

    dynamic buttonContent = type == Buttontype.iconButton
        ? icon
        : Row(
          mainAxisSize: isBlock ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
            if (icon != null) ...[const SizedBox(width: 8), icon!],
          ],
        );
    switch (type) {
      case Buttontype.textButton:
        actualButton = TextButton(
          onPressed: onPressed,
          child: buttonContent,
          style: style,
        );
        break;
      case Buttontype.outlinedButton:
        actualButton = OutlinedButton(
            onPressed: onPressed, child: buttonContent, style: style);
      case Buttontype.iconButton:
        actualButton =
            IconButton(onPressed: onPressed, icon: buttonContent, style: style);
        break;
      default:
        actualButton = ElevatedButton(
            onPressed: onPressed, child: buttonContent, style: style);
    }
    return actualButton;
  }
}

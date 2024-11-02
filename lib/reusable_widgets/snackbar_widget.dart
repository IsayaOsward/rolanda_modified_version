// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SlidingSnackBar extends StatefulWidget {
  final String message;
  final Duration duration;
  final bool success;

  const SlidingSnackBar({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 2), required this.success,
  });

  @override
  _SlidingSnackBarState createState() => _SlidingSnackBarState();
}

class _SlidingSnackBarState extends State<SlidingSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _controller.forward().then((_) {
      Future.delayed(widget.duration).then((_) {
        _controller.reverse().then((_) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(_controller),
      child: SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: widget.success ? Colors.green : Colors.red,
        content: Text(widget.message),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go('/home-guest'),
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      child: const Text(
        'Bỏ qua',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

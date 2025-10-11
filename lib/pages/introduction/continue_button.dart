import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContinueButton extends StatelessWidget {
  final String label;
  final String target;

  const ContinueButton({super.key, required this.label, required this.target});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go(target),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFF28F8F),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

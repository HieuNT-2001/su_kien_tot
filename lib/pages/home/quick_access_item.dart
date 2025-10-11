// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double size;
  final String target;
  final Color background;
  final Color foreground;

  const QuickAccessItem({
    super.key,
    required this.icon,
    required this.title,
    required this.target,
    this.size = 50,
    this.background = const Color(0xFFF28F8F),
    this.foreground = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(target),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: background,
            child: Padding(
              padding: EdgeInsets.all(size / 8),
              child: Icon(icon, size: size, color: Colors.black),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: foreground),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

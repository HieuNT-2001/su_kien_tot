import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String icon;
  final String title;
  final String? subtitle;
  final double? size;
  final VoidCallback? onTap;

  const ServiceItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.size = 50,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Image.asset(icon, width: size, height: size),
            const SizedBox(height: 8),
            if (subtitle != null) ...[
              Text(
                subtitle!,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

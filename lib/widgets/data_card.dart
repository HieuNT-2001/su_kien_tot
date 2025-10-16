import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DataCard extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String content;
  final String? extra;
  final String timestamp;
  final bool isLoading;

  const DataCard({
    super.key,
    this.icon,
    required this.title,
    required this.content,
    required this.timestamp,
    this.isLoading = false,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: Colors.amber, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(content, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(timestamp),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (extra != null) ...[Text(extra!)],
            ],
          ),
        ),
      ),
    );
  }
}

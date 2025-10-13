import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String? title;
  final String imageSrc;
  final VoidCallback? onTap;

  const ImageCard({super.key, this.title, required this.imageSrc, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imageSrc),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

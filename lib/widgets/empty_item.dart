import 'package:flutter/material.dart';

class EmptyItem extends StatelessWidget {
  final String title;

  const EmptyItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/empty.png', height: 120),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

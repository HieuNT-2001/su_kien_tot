import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;

  const CustomSearchBar({super.key, this.hintText = 'Tìm kiếm', this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          hintText: hintText,
          leading: const Icon(Icons.search),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}

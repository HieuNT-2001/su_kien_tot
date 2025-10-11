import 'package:flutter/material.dart';

class FloatingBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FloatingBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Trang chủ', 'icon': Icons.home},
      {'label': 'Hoạt động', 'icon': Icons.receipt_long},
      {'label': '', 'icon': Icons.smart_toy},
      {'label': 'Thông báo', 'icon': Icons.notifications},
      {'label': 'Tài khoản', 'icon': Icons.person},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final bool isSelected = currentIndex == index;
          final item = items[index];
          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFF28F8F)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              width: isSelected ? 120 : 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item['icon'] as IconData?,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Text(
                      isSelected ? item['label'] as String : '',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

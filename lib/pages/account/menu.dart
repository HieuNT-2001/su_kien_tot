import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/account/menu_item.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> items;

  const Menu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          for (var item in items) ...[
            MenuItem(title: item.title, icon: item.icon, onTap: item.onTap),
          ],
        ],
      ),
    );
  }
}

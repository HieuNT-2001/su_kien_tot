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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            MenuItem(
              title: items[i].title,
              icon: items[i].icon,
              onTap: items[i].onTap,
            ),
          ],
        ],
      ),
    );
  }
}

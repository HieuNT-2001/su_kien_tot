import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/account/menu.dart';
import 'package:su_kien_tot/pages/account/menu_item.dart';

class MenuSection2 extends StatelessWidget {
  const MenuSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Menu(
      items: [
        MenuItem(
          title: 'Cài đặt',
          icon: Icons.settings_outlined,
          onTap: () => context.push('/setting-page'),
        ),
        MenuItem(
          title: 'Ngôn ngữ',
          icon: Icons.language,
          onTap: () => context.push('/language-page'),
        ),
      ],
    );
  }
}

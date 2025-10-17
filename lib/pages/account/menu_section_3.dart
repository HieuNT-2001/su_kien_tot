import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/account/menu.dart';
import 'package:su_kien_tot/pages/account/menu_item.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class MenuSection3 extends StatelessWidget {
  const MenuSection3({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCustomer = context.watch<AppState>().role == 'customer';

    return Menu(
      items: [
        if (isCustomer) ...[
          MenuItem(
            title: 'Yêu thích',
            icon: Icons.favorite_outline,
            onTap: () => context.push('/favorite-page'),
          ),
        ],
        MenuItem(title: 'Hỗ trợ', icon: Icons.support_agent, onTap: () {}),
        MenuItem(
          title: 'Điều khoản & quyền riêng tư',
          icon: Icons.article_outlined,
          onTap: () {},
        ),
        MenuItem(title: 'Về chúng tôi', icon: Icons.info_outline, onTap: () {}),
        MenuItem(
          title: 'Những câu hỏi thường gặp (FAQ)',
          icon: Icons.live_help_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

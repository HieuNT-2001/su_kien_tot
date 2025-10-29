import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/account/menu.dart';
import 'package:su_kien_tot/pages/account/menu_item.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class MenuSection1 extends StatelessWidget {
  const MenuSection1({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCustomer = context.watch<AppState>().role == 'customer';

    return Menu(
      items: [
        MenuItem(
          title: isCustomer ? 'Thanh toán' : 'Ví Vua Thợ',
          icon: Icons.wallet,
          onTap: () =>
              context.push(isCustomer ? '/payment-page' : '/wallet-page'),
        ),
        MenuItem(
          title: isCustomer ? 'Ưu đãi của bạn' : 'Nghiệp vụ của bạn',
          icon: isCustomer ? Icons.discount_outlined : Icons.work_outline,
          onTap: () => context.push(isCustomer ? '/voucher-page' : '/'),
        ),
      ],
    );
  }
}

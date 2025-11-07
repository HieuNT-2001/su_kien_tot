import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/home/quick_access_item.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Truy cập nhanh', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuickAccessItem(
              icon: Icons.wallet_outlined,
              title: 'Lịch sử\ngiao dịch',
              target: '/transaction-page',
              size: 50,
            ),
            QuickAccessItem(icon: Icons.discount_outlined, title: 'Ưu đãi\ncủa bạn', target: '/voucher-page', size: 50),
            QuickAccessItem(
              icon: Icons.person_add_alt_outlined,
              title: 'Mời bạn bè',
              target: '/add-friend-page',
              size: 50,
            ),
            QuickAccessItem(icon: Icons.star_border_rounded, title: 'Yêu thích', target: '/favorite-page', size: 50),
          ],
        ),
      ],
    );
  }
}

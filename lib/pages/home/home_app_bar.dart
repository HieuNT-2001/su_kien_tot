import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/widgets/role_switch.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCustomer = context.watch<AppState>().role == 'customer';
    String title = isCustomer
        ? 'Đăng ký ngay để tìm nhân viên sự kiện'
        : 'Hoàn tất đăng ký để nhận công\nviệc ngay hôm nay!';
    String imageIcon = isCustomer
        ? 'assets/images/khach.png'
        : 'assets/images/vendor.png';

    return Column(
      children: [
        const Row(
          children: [
            Text('Trang chủ', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            RoleSwitch(),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => context.push('/login-register'),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bạn chưa có tài khoản sự kiện tốt?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(title, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Spacer(),
              Image.asset(imageIcon, height: 80),
            ],
          ),
        ),
      ],
    );
  }
}

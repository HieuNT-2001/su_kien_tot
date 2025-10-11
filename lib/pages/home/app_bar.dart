import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class HomeAppBar extends StatelessWidget {
  final ValueChanged<bool> onChanged;

  const HomeAppBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    bool isCustomer = context.read<AppState>().role == 'customer';
    String roleName = isCustomer ? 'Khách hàng' : 'Người làm sự kiện';
    String title = isCustomer
        ? 'Đăng ký ngay để tìm nhân viên sự kiện'
        : 'Hoàn tất đăng ký để nhận công\nviệc ngay hôm nay!';
    String imageIcon = isCustomer
        ? 'assets/images/khach.png'
        : 'assets/images/vendor.png';

    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Trang chủ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              roleName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Transform.scale(
              scale: 1.2,
              child: Switch(
                activeThumbImage: const AssetImage('assets/images/khach.png'),
                inactiveThumbImage: const AssetImage(
                  'assets/images/vendor.png',
                ),
                value: isCustomer,
                onChanged: onChanged,
              ),
            ),
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

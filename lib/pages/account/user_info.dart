import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    String accountStatus = context.read<AppState>().accountStatus;

    return GestureDetector(
      onTap: () => context.push('/profile-page'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/images/user.png')),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nguyễn Trung Hiếu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Row(
                    children: [
                      if (accountStatus == 'pending') ...const [
                        Icon(Icons.pending_actions, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Text('Đang duyệt', style: TextStyle(color: Colors.grey)),
                      ] else ...const [
                        Icon(Icons.error, color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text('Xác minh tài khoản', style: TextStyle(color: Colors.red)),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 36),
          ],
        ),
      ),
    );
  }
}

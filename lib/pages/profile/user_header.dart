import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final bool isVerified;

  const UserHeader({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF28F8F), Color.fromARGB(255, 242, 190, 190)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nguyễn Trung Hiếu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 18),
              SizedBox(width: 6),
              Text('0123456789', style: TextStyle(fontSize: 18)),
            ],
          ),
          if (!isVerified) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'Xác minh tài khoản',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

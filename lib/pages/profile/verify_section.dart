import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifySection extends StatelessWidget {
  final bool isVerified;

  const VerifySection({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFF28F8F),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/verify.png', height: 60),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xác minh tài khoản',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('• Xác thực giấy tờ tùy thân\n• Xác thực khuôn mặt'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => context.push('/guide-page'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFF28F8F),
              minimumSize: const Size(double.infinity, 50),
            ),
            label: const Text(
              'Xác thực ngay',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
            iconAlignment: IconAlignment.end,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

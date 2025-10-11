import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopupModel extends StatelessWidget {
  const PopupModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 160,
        child: Column(
          children: [
            const Text(
              'Sử dụng vua thợ ngay!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Chỉ cần 10 giây, bạn có thể truy cập vào các dịch vụ của chúng tôi và đặt thợ',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.push('/login-register'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFF28F8F),
                      side: const BorderSide(color: Color(0xFFF28F8F)),
                    ),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.push('/login-register'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFF28F8F),
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

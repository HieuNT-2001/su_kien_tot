import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 304),
            const Icon(Icons.mail_outlined, size: 64),
            const SizedBox(height: 8),
            const Text('Cảm ơn bạn đã gửi hồ sơ!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Chúng tôi sẽ xem xét hồ sơ của bạn và sẽ thông báo cho bạn trong thời gian sớm nhất.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pushReplacement('/help-page'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFF28F8F),
                      side: const BorderSide(color: Color(0xFFF28F8F), width: 1.5),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text('Liên hệ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.go('/account'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFF28F8F),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text('Xong', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

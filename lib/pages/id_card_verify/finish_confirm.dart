import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinishConfirm extends StatelessWidget {
  const FinishConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 256),
            const Text(
              'Hồ sơ của bạn đang được duyệt',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/confirm.png', height: 200),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/account'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28F8F),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Xong',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

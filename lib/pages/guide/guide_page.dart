import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/guide/step_1.dart';
import 'package:su_kien_tot/pages/guide/step_2.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hướng dẫn',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Step1(),
            const SizedBox(height: 16),
            const Step2(),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/verify-page'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFF28F8F),
                minimumSize: const Size(double.infinity, 50),
                disabledBackgroundColor: Colors.grey,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

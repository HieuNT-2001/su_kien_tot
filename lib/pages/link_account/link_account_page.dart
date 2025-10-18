import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/link_account/link_account_model.dart';

class LinkAccountPage extends StatelessWidget {
  const LinkAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liên kết tài khoản',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tài khoản thanh toán',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                radius: Radius.circular(10),
                color: Color(0xFFF28F8F),
                dashPattern: [8, 4],
              ),
              child: TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const LinkAccountModel(),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 24),
                    Text(
                      'Thêm liên kết tài khoản',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

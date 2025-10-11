import 'package:flutter/material.dart';

class RegisterModel extends StatelessWidget {
  const RegisterModel({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Hoàn tất đăng ký để bắt đầu nhận việc',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bạn cần hoàn tất quá trình đăng ký để trở thành nhân viên chuyên nghiệp.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Image.asset('assets/images/vendor.png', height: 150),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28F8F),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Tiếp tục đăng ký',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Để sau',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const RegisterBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF28F8F),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hoàn tất đăng ký để nhận\ncông việc ngay hôm nay!',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  label: const Text(
                    'Tiếp tục đăng ký',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ),
          Image.asset('assets/images/vendor.png', height: 80),
        ],
      ),
    );
  }
}

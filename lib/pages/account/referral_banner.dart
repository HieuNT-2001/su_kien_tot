import 'package:flutter/material.dart';

class ReferralBanner extends StatelessWidget {
  const ReferralBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFFF28F8F), Color.fromARGB(255, 242, 190, 190)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Giới thiệu bạn bè'),
                Text(
                  'Nhận tiền liền tay',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < 3; i++) ...[
                Transform.translate(
                  offset: Offset(-i * 15, 0), // chồng dần qua trái
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
              ],
              const Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }
}

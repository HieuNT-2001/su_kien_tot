import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/add_friend/share_model.dart';

class ReferralBonusBanner extends StatelessWidget {
  const ReferralBonusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(colors: [Color(0xFFF28F8F), Color.fromARGB(255, 242, 190, 190)]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text('Tiền thưởng chưa khả dụng'),
              const SizedBox(height: 8),
              const Text('0 đ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 30),
                  for (int i = 0; i < 3; i++) ...[
                    Transform.translate(
                      offset: Offset(-i * 15, 0), // chồng dần qua trái
                      child: const CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/images/user.png')),
                    ),
                  ],
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('Mã giới thiệu:'),
              const SizedBox(height: 8),
              const Text('89533', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => showDialog(context: context, builder: (context) => const ShareModel()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  minimumSize: const Size(50, 50),
                ),
                child: const Text('Chia sẻ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

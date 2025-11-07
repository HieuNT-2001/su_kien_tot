import 'package:flutter/material.dart';

class ReferralBonusWallet extends StatelessWidget {
  const ReferralBonusWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tiền thưởng chưa khả dụng'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('0 đ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  ),
                  child: const Text('Rút tiền', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

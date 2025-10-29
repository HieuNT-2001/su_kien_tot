import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/wallet/wallet_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ví',
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
          children: [
            WalletCard(
              title: 'Ví doanh thu',
              color: Colors.blue,
              balance: '0 đ',
              action: () => context.push('/'),
            ),
            const SizedBox(height: 20),
            WalletCard(
              title: 'Ví chi phí',
              color: Colors.green,
              balance: '0 đ',
              action: () => context.push('/'),
            ),
          ],
        ),
      ),
    );
  }
}

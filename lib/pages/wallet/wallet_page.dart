import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/wallet/wallet_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  Widget _buildWalletCard(String title, Color color, String balance) {
    return Stack(
      children: [
        WalletCard(title: title, color: color, balance: balance),
        Positioned(
          right: 8,
          top: 8,
          child: CircleAvatar(
            backgroundColor: color,
            child: const Icon(
              Icons.arrow_outward,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

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
            GestureDetector(
              onTap: () => context.push('/revenue-wallet'),
              child: _buildWalletCard('Ví doanh thu', Colors.blue, '0 đ'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => context.push('/expense-wallet'),
              child: _buildWalletCard('Ví chi phí', Colors.green, '0 đ'),
            ),
          ],
        ),
      ),
    );
  }
}

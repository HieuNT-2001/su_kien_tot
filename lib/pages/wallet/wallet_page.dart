import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/wallet/wallet_card.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  Widget _buildWalletCard({
    required String title,
    required Color color,
    required String balance,
    required VoidCallback action,
    required bool showBalance,
  }) {
    return Stack(
      children: [
        WalletCard(
          title: title,
          color: color,
          balance: balance,
          action: action,
          showBalance: showBalance,
        ),
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
    bool showRevenue = context.watch<AppState>().isRevenueVisible;
    bool showExpense = context.watch<AppState>().isExpenseVisible;

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
              child: _buildWalletCard(
                title: 'Ví doanh thu',
                color: Colors.blue,
                balance: '0 đ',
                action: () =>
                    context.read<AppState>().setRevenueVisible(!showRevenue),
                showBalance: context.read<AppState>().isRevenueVisible,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => context.push('/expense-wallet'),
              child: _buildWalletCard(
                title: 'Ví chi phí',
                color: Colors.green,
                balance: '0 đ',
                action: () =>
                    context.read<AppState>().setExpenseVisible(!showExpense),
                showBalance: context.read<AppState>().isExpenseVisible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

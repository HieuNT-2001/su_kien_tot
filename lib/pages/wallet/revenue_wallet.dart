import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/wallet/wallet_card.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/widgets/transaction_history_section.dart';

class RevenueWallet extends StatelessWidget {
  const RevenueWallet({super.key});

  @override
  Widget build(BuildContext context) {
    bool showRevenue = context.watch<AppState>().isRevenueVisible;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Stack(
                children: [
                  WalletCard(
                    title: 'Ví doanh thu',
                    color: Colors.blue,
                    balance: '0 đ',
                    action: () => context.read<AppState>().setRevenueVisible(!showRevenue),
                    showBalance: context.read<AppState>().isRevenueVisible,
                  ),
                  Positioned(
                    left: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 32),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.push('/cashout-page'),
                icon: const Icon(Icons.remove_circle_outline_rounded),
                label: const Text('Rút tiền', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  elevation: 4,
                ),
              ),
              const SizedBox(height: 32),
              const TransactionHistorySection(),
            ],
          ),
        ),
      ),
    );
  }
}

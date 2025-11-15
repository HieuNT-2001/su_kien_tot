import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/wallet/wallet_card.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/widgets/transaction_history_section.dart';

class ExpenseWallet extends StatelessWidget {
  const ExpenseWallet({super.key});

  @override
  Widget build(BuildContext context) {
    bool showExpense = context.watch<AppState>().isExpenseVisible;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Stack(
                children: [
                  WalletCard(
                    title: 'Ví chi phí',
                    color: Colors.green,
                    balance: '0 đ',
                    action: () => context.read<AppState>().setExpenseVisible(!showExpense),
                    showBalance: context.read<AppState>().isExpenseVisible,
                  ),
                  Positioned(
                    left: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 32),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.push('/topup-page'),
                icon: const Icon(Icons.add_card_rounded),
                label: const Text('Nạp tiền', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
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

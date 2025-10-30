import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class TransactionHistorySection extends StatefulWidget {
  const TransactionHistorySection({super.key});

  @override
  TransactionHistorySectionState createState() =>
      TransactionHistorySectionState();
}

class TransactionHistorySectionState extends State<TransactionHistorySection> {
  bool _isLoading = true;
  List<String> _transactions = [];

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _transactions = [
      'Giao dịch 1',
      'Giao dịch 2',
      'Giao dịch 2',
      'Giao dịch 2',
      'Giao dịch 2',
    ];
    // bạn có thể thử: ["Giao dịch 1", "Giao dịch 2"]
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  // Phần lịch sử giao dịch cố định không thể cuộn cho
  // các trang thanh toán và ví (payment_page, wallet_page)
  // Hiển thị tối đa 5 lịch sử giao dịch
  @override
  Widget build(BuildContext context) {
    int length = _isLoading ? 4 : _transactions.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có giao dịch');

    return Column(
      children: [
        GestureDetector(
          onTap: () => context.push('/transaction-page'),
          child: const Row(
            children: [
              Text(
                'Lịch sử giao dịch',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Skeletonizer(
          enabled: _isLoading,
          child: Column(
            children: List.generate(length, (index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    'Giao dịch ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mô tả giao dịch ${index + 1}'),
                      const SizedBox(height: 4),
                      const Text('10/10/2025'),
                    ],
                  ),
                  trailing: const Text(
                    '150.000đ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

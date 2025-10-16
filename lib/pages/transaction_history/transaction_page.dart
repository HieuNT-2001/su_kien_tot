import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/widgets/data_card.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  bool _isLoading = true;
  List<String> _transactions = [];

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _transactions = ['Giao dịch 1'];
    // bạn có thể thử: ["Giao dịch 1", "Giao dịch 2"]
    setState(() => _isLoading = false);
  }

  Future<void> _emptyData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _transactions = [];

    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _transactions.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có giao dịch');

    return Column(
      children: List.generate(length, (index) {
        return DataCard(
          isLoading: _isLoading,
          title: 'Thanh toán dịch vụ sửa chữa bồn cầu?',
          content: 'Nguyên nhân đến từ tắc nghẽn bồn cầu!',
          timestamp: '10/10/2025',
          extra: '150.000đ',
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _emptyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lịch sử giao dịch',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 24),
          onPressed: () => context.go('/home-user'),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildDataSection()],
          ),
        ),
      ),
    );
  }
}

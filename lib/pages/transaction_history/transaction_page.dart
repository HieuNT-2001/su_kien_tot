import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/pages/transaction_history/select_date.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  bool _isLoading = true;
  int selectedIndex = 0;
  DateTime? fromDate;
  DateTime? toDate;
  List<String> _transactions = [];

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _transactions = ['Giao dịch 1'];
    // bạn có thể thử: ["Giao dịch 1", "Giao dịch 2"]
    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _transactions.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có giao dịch');

    return Skeletonizer(
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
    );
  }

  void showSelectDateBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(),
      builder: (context) => SelectDate(selectedIndex: selectedIndex),
    );

    if (result != null) {
      setState(() {
        selectedIndex = result['selectedIndex'];
        fromDate = result['fromDate'];
        toDate = result['toDate'];
      });
      _refreshData(); // gọi API lọc
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
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
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => showSelectDateBottomSheet(context),
                label: const Text('Chọn thời gian'),
                icon: const Icon(Icons.calendar_month_outlined),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
              ),
              _buildDataSection(),
            ],
          ),
        ),
      ),
    );
  }
}

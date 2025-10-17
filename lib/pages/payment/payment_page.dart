import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  bool _isLoading = true;
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
              trailing: const Text('150.000đ'),
            ),
          );
        }),
      ),
    );
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
          'Thanh toán',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.go('/account'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFF28F8F),
                child: Icon(Icons.add),
              ),
              label: const Text(
                'Liên kết',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                elevation: 4,
              ),
            ),
            const SizedBox(height: 32),
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
            Expanded(child: ListView(children: [_buildDataSection()])),
          ],
        ),
      ),
    );
  }
}

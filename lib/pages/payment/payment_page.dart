import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/widgets/data_card.dart';
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
              icon: const CircleAvatar(radius: 10, child: Icon(Icons.add)),
              label: const Text('Thêm giao dịch'),
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
            _buildDataSection(),
          ],
        ),
      ),
    );
  }
}

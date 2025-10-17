import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  VoucherPageState createState() => VoucherPageState();
}

class VoucherPageState extends State<VoucherPage> {
  bool _isLoading = true;
  List<String> _vouchers = [];

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _vouchers = ['Voucher 1'];
    // bạn có thể thử: ["Voucher 1", "Voucher 2"]
    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _vouchers.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có voucher');

    return Skeletonizer(
      enabled: _isLoading,
      child: Column(
        children: List.generate(length, (index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset('assets/images/voucher.png'),
              title: Text(
                'Voucher ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Mô tả voucher ${index + 1}'),
              trailing: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey[300],
              ),
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
          'Voucher giảm giá',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 24),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [_buildDataSection()]),
      ),
    );
  }
}

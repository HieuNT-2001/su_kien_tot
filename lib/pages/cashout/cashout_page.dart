import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class CashoutPage extends StatefulWidget {
  const CashoutPage({super.key});

  @override
  CashoutPageState createState() => CashoutPageState();
}

class CashoutPageState extends State<CashoutPage> {
  final _accountNumberController = TextEditingController();
  final _balanceController = TextEditingController();
  bool canWithdraw = false;

  void _updateCanWithdraw() {
    String selectedBank = context.read<AppState>().selectedBank;
    bool enable =
        selectedBank.isNotEmpty && _accountNumberController.text.isNotEmpty && _balanceController.text.isNotEmpty;
    if (enable != canWithdraw) {
      setState(() => canWithdraw = enable);
    }
  }

  void pop() {
    context.read<AppState>().setSelectedBank('');
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _accountNumberController.addListener(_updateCanWithdraw);
    _balanceController.addListener(_updateCanWithdraw);
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedBank = context.watch<AppState>().selectedBank;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rút tiền', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => pop()),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    tileColor: Colors.blue[800],
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                    leading: const Icon(Icons.account_balance_wallet_outlined, size: 28),
                    title: const Text('Số dư ví'),
                    subtitle: const Text('0đ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  const Text('Ngân hàng', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  ListTile(
                    onTap: () => context.push('/select-bank-page'),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    title: Text(selectedBank.isEmpty ? 'Chọn ngân hàng' : selectedBank),
                    trailing: const Icon(Icons.chevron_right_rounded, size: 32, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text('Số tài khoản', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: _accountNumberController,
                      decoration: const InputDecoration(hintText: '1234-5678-9876-5432', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Nhập số tiền cần rút', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.59,
                          child: TextFormField(
                            controller: _balanceController,
                            decoration: const InputDecoration(hintText: '0', border: InputBorder.none),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Tất cả',
                            style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: canWithdraw ? () {} : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800], foregroundColor: Colors.white),
              child: const Text('Rút tiền', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}

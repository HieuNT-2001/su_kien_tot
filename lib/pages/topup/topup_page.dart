import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  TopupPageState createState() => TopupPageState();
}

class TopupPageState extends State<TopupPage> {
  final _balanceController = TextEditingController();
  bool isSelected = true;
  bool canTopup = false;

  void _updateCanWithdraw() {
    bool enable = _balanceController.text.isNotEmpty;
    if (enable != canTopup) {
      setState(() => canTopup = enable);
    }
  }

  @override
  void initState() {
    super.initState();
    _balanceController.addListener(_updateCanWithdraw);
  }

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nạp tiền tiền', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      tileColor: Colors.grey[100],
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                      title: const Text('Số dư ví:'),
                      subtitle: const Text('0đ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 16),
                    const Text('Nhập số tiền cần nạp', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: _balanceController,
                        decoration: const InputDecoration(hintText: '0', border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Nguồn nạp tiền', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ListTile(
                      onTap: () => setState(() => isSelected = !isSelected),
                      minTileHeight: 60,
                      tileColor: isSelected ? Colors.blue[50] : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: BorderSide(color: isSelected ? Colors.blue.shade900 : Colors.grey),
                      ),
                      leading: Image.asset('assets/images/momo.png', width: 30, height: 30),
                      title: const Text('Ví MoMo', style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      onTap: () => setState(() => isSelected = !isSelected),
                      minTileHeight: 60,
                      tileColor: !isSelected ? Colors.blue[50] : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: BorderSide(color: !isSelected ? Colors.blue.shade900 : Colors.grey),
                      ),
                      leading: Image.asset('assets/images/paypal.png', width: 30, height: 30),
                      title: const Text('Paypal', style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(!isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: canTopup ? () {} : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800], foregroundColor: Colors.white),
            child: const Text('Nạp tiền', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

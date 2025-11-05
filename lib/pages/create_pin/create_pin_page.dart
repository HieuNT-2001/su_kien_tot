import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  CreatePinPageState createState() => CreatePinPageState();
}

class CreatePinPageState extends State<CreatePinPage> {
  bool _showPin = false;
  bool _isConfirmStep = false;
  String? _pin;
  final _pinController = TextEditingController();

  void _onPinCompleted(String pin) {
    if (!_isConfirmStep) {
      // Bước 1: nhập PIN lần đầu
      _pin = pin;
      setState(() {
        _isConfirmStep = true;
        _pinController.clear(); // reset lại ô nhập
      });
    } else {
      // Bước 2: xác nhận lại PIN
      if (pin == _pin) {
        // ✅ PIN khớp
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tạo mã PIN thành công!')));
      } else {
        // ❌ PIN không khớp
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Mã PIN không khớp, vui lòng thử lại!')));
        setState(() {
          _isConfirmStep = false;
          _pin = null;
          _pinController.clear(); // reset lại để nhập lại từ đầu
        });
      }
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo mã PIN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isConfirmStep ? 'Xác nhận mã PIN' : 'Nhập mã PIN mới',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => setState(() => _showPin = !_showPin),
                  child: Icon(_showPin ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Pinput(
              length: 6,
              controller: _pinController,
              obscureText: !_showPin,
              obscuringWidget: const Icon(Icons.circle, size: 12),
              keyboardType: TextInputType.number,
              onCompleted: _onPinCompleted,
              defaultPinTheme: PinTheme(
                width: 48,
                height: 48,
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/setting/delete_account_model.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  Widget _buildSettingOption(String label, IconData icon, VoidCallback? action) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
      onTap: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSettingOption('Tạo mã PIN', Icons.lock_outline, () => context.push('/create-pin-page')),
            _buildSettingOption('Đăng xuất', Icons.logout_outlined, () => context.go('/home-guest')),
            GestureDetector(
              onTap: () => showDialog(context: context, builder: (context) => const DeleteAccountModel()),
              child: const Text('Xóa tài khoản'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    String role = context.watch<AppState>().role;

    return ElevatedButton(
      onPressed: () => context.go('/introduction1'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF28F8F),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        role.isEmpty ? 'Vui lòng chọn một vai trò để tiếp tục' : 'Tiếp tục',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/start/continue_button.dart';
import 'package:su_kien_tot/pages/start/customer_select.dart';
import 'package:su_kien_tot/pages/start/vendor_select.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    String role = context.watch<AppState>().role;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Bạn là?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomerSelect(
              isSelected: role == 'customer',
              onSelect: () => context.read<AppState>().setRole('customer'),
            ),
            const SizedBox(height: 30),
            VendorSelect(
              isSelected: role == 'vendor',
              onSelect: () => context.read<AppState>().setRole('vendor'),
            ),
            const SizedBox(height: 30),
            const ContinueButton(),
          ],
        ),
      ),
    );
  }
}

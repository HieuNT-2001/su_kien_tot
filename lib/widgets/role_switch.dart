import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class RoleSwitch extends StatelessWidget {
  const RoleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCustomer = context.watch<AppState>().role == 'customer';
    String roleName = isCustomer ? 'Khách hàng' : 'Người làm sự kiện';

    return Row(
      children: [
        Text(
          roleName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Transform.scale(
          scale: 1.2,
          child: Switch(
            activeThumbImage: const AssetImage('assets/images/khach.png'),
            inactiveThumbImage: const AssetImage('assets/images/vendor.png'),
            onChanged: (_) => context.read<AppState>().setRole(
              isCustomer ? 'vendor' : 'customer',
            ),
            value: isCustomer,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/home/register_model.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  void _showPopupModel(BuildContext context) {
    showDialog(context: context, builder: (context) => const RegisterModel());
  }

  Widget _buildSmallCard(String title, String value, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSmallCard(
            'Đang tiến hành',
            '0 đơn',
            onTap: () => _showPopupModel(context),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSmallCard(
            'Đang báo giá',
            '0 đơn',
            onTap: () => _showPopupModel(context),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final Color color;
  final String balance;
  final VoidCallback? action;

  const WalletCard({
    super.key,
    required this.title,
    required this.color,
    required this.balance,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        balance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                backgroundColor: color,
                child: const Icon(
                  Icons.arrow_outward,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

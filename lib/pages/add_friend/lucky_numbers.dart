import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LuckyNumbers extends StatelessWidget {
  const LuckyNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text('Dãy số may mắn của bạn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(width: 4),
            Icon(Icons.live_help_outlined, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 103, 198, 245), Color.fromARGB(255, 8, 88, 154)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.amber[600], borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (_) => CircleAvatar(
                      backgroundColor: Colors.orange[700],
                      child: const Text('??', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => context.push('/ticket-page'),
          label: const Text('Xem chi tiết', style: TextStyle(fontWeight: FontWeight.normal)),
          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14, fontWeight: FontWeight.normal),
          iconAlignment: IconAlignment.end,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minimumSize: const Size(50, 30),
            elevation: 2,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ],
    );
  }
}

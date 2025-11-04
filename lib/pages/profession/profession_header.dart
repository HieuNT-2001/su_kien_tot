import 'package:flutter/material.dart';

class ProfessionHeader extends StatelessWidget {
  const ProfessionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Text(
              'Thêm nghiệp vụ mới',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text(
                'Thêm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

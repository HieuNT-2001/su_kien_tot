import 'package:flutter/material.dart';

class MessagesArea extends StatefulWidget {
  const MessagesArea({super.key});

  @override
  MessagesAreaState createState() => MessagesAreaState();
}

class MessagesAreaState extends State<MessagesArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Anh/chị cần em hỗ trợ gì cho sự kiện nè? sân khấu, '
                'MC, quay chụp, biểu diễn ạ? 😊🎉',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Sự kiện tốt AI có thể gây ra nhầm lẫn. '
              'Sự kiện tốt sẽ cố gắng hoàn thiện hơn',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

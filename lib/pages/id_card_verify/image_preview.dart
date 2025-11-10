import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/id_card_verify/back_alert_dialog.dart';

class ImagePreview extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback next;
  final bool isConfirm;

  const ImagePreview({
    super.key,
    required this.title,
    required this.imagePath,
    required this.next,
    required this.isConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 640,
            child: Image.file(File(imagePath), fit: BoxFit.cover),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded, size: 28, color: Colors.white),
                      onPressed: () => showDialog(context: context, builder: (context) => const BackAlertDialog()),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Trở lại'),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.refresh_rounded, size: 28, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Chụp lại'),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(
                        isConfirm ? Icons.check_rounded : Icons.arrow_forward_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: next,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(isConfirm ? 'Hoàn tất' : 'Tiếp tục'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/help/contact_info.dart';
import 'package:su_kien_tot/pages/help/social_media.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hỗ trợ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [ContactInfo(), SizedBox(height: 32), SocialMedia()],
        ),
      ),
    );
  }
}

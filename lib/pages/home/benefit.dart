import 'package:flutter/material.dart';
import 'package:su_kien_tot/widgets/image_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Benefit extends StatelessWidget {
  const Benefit({super.key});

  Future<void> _launchBenefits() async {
    Uri url = Uri.parse('https://sukientot.taiyo.space/');
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quyền lợi',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < 3; i++) ...[
          ImageCard(
            onTap: () => _launchBenefits(),
            imageSrc: 'assets/images/banner.png',
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}

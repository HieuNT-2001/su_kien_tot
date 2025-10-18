import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $uri');
    }
  }

  Widget _buildSocialMedia(String label, String image, String url) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      child: ListTile(
        leading: Image.asset('assets/images/$image', height: 28, width: 28),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () => _launchUrl(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Mạng xã hội Sự Kiện Tốt',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildSocialMedia(
          'Facebook',
          'facebook.png',
          'https://www.facebook.com/',
        ),
        _buildSocialMedia('Zalo', 'zalo.png', 'https://zalo.me/pc'),
        _buildSocialMedia('Tiktok', 'tiktok.png', 'https://www.tiktok.com/'),
        _buildSocialMedia('Youtube', 'youtube.png', 'https://www.youtube.com/'),
      ],
    );
  }
}

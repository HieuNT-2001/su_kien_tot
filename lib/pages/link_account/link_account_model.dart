import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkAccountModel extends StatelessWidget {
  const LinkAccountModel({super.key});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://sukientot.taiyo.space/');
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $url');
    }
  }

  Widget _buildBulletItem(String data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '\u2022',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            data,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thêm liên kết thẻ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  const TextSpan(
                    text: 'Thông qua việc tiếp tục, bạn đã chấp nhận ',
                  ),
                  TextSpan(
                    text: 'điều khoản & chính sách',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _launchUrl,
                  ),
                  const TextSpan(text: ' sử dụng của Sự kiện tốt'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildBulletItem(
              'Chỉ hỗ trợ thẻ VISA, Mastercard và JCB có hiệu lực tại Việt Nam',
            ),
            const SizedBox(height: 16),
            _buildBulletItem(
              'Tài khoản của bạn sẽ bị trừ 1000đ cho lần đầu '
              'thêm thẻ. Số tiền này sẽ được hoàn lại sau khi thành công',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFF28F8F),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        color: Color(0xFFF28F8F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28F8F),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text(
                      'Đồng ý',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

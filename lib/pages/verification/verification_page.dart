import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:su_kien_tot/models/language_option.dart';
import 'package:su_kien_tot/utils/flag_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerificationPage> {
  final List<LanguageOption> allLanguages = [LanguageOption('Tiếng Việt', 'VN')];

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://sukientot.taiyo.space/');
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $url');
    }
  }

  Future<void> accessCamera() async {
    // Xin quyền camera
    final status = await Permission.camera.request();

    if (!mounted) return;

    if (status.isGranted) {
      context.push('/front-id-card-capture', extra: 'Chụp mặt trước của giấy tờ');
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Vui lòng cấp quyền truy cập máy ảnh để tiếp tục')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác minh tài khoản', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quốc tịch', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              leading: Text(allLanguages[0].countryCode.toFlagEmoji, style: const TextStyle(fontSize: 40)),
              title: const Text('Chọn khu vực/quốc gia', style: TextStyle(fontSize: 14, color: Colors.grey)),
              subtitle: const Text('Vietnam', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chevron_right, size: 40, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text('Loại giấy tờ xác minh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 190, 190),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ListTile(title: Text('Căn cước công dân'), trailing: Icon(Icons.radio_button_checked)),
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 13, color: Colors.black),
                children: [
                  const TextSpan(text: 'Thông qua việc đồng ý và tiếp tục, tôi đồng ý với '),
                  TextSpan(
                    text: 'chính sách bảo mật ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _launchUrl,
                  ),
                  const TextSpan(
                    text:
                        'và đồng ý với việc xử lý dữ liệu cá '
                        'nhân của mình như mô tả trong ',
                  ),
                  TextSpan(
                    text: 'điều khoản và điều kiện ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _launchUrl,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: accessCamera,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFF28F8F),
                minimumSize: const Size(double.infinity, 50),
                disabledBackgroundColor: Colors.grey,
              ),
              child: const Text('Đồng ý & tiếp tục', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Sự kiện tốt cam kết bảo mật thông tin cá nhân của người dùng',
                style: TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final Uri _url = Uri.parse('https://vuatho.com/vi/terms-and-condition');
  final _phoneController = TextEditingController();
  bool isEnabled = false;

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $_url');
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      setState(() {
        isEnabled = _phoneController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text(
              'Nhập số điện thoại của bạn để bắt đầu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Một mã sẽ được gửi đến số điện thoại của bạn để xác minh rằng nó thuộc về bạn.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CountryCodePicker(
                      onChanged: (code) {},
                      initialSelection: 'VN',
                      favorite: const ['+84', 'VN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _phoneController,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Số điện thoại',
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
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
            ElevatedButton(
              onPressed: isEnabled ? () => context.go('/home-user') : null,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFF28F8F),
                minimumSize: const Size(double.infinity, 50),
                disabledBackgroundColor: Colors.grey,
              ),
              child: const Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

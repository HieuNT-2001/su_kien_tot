import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/introduction/continue_button.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class Introduction3 extends StatelessWidget {
  const Introduction3({super.key});

  @override
  Widget build(BuildContext context) {
    String role = context.watch<AppState>().role;
    String title = role == 'customer'
        ? 'Sự kiện lớn nhỏ, Cứ để Sự Kiện Tốt lo!'
        : 'Hỗ trợ nghiệp vụ';
    String subTitle = role != 'customer'
        ? 'Nâng cao tay nghề với các khóa\nđào tạo hàng đầu.'
        : '';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/yard.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Tiếng việt'),
                  icon: const Icon(Icons.language),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue[900],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Row(
                children: [
                  Spacer(),
                  Expanded(
                    child: ContinueButton(
                      label: 'Bắt đầu',
                      target: '/home-guest',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

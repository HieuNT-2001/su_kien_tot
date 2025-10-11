import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/introduction/continue_button.dart';
import 'package:su_kien_tot/pages/introduction/skip_button.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class Introduction1 extends StatelessWidget {
  const Introduction1({super.key});

  @override
  Widget build(BuildContext context) {
    String role = context.watch<AppState>().role;
    String title = role == 'customer'
        ? 'Tổ chức sự kiện?\nĐừng lo\nCó Sự kiện tốt!'
        : 'Việc có liền tay';
    String subTitle = role != 'customer'
        ? 'Tìm việc, kết nối với khách hàng\nmột cách nhanh chóng.'
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
                  Expanded(child: SkipButton()),
                  SizedBox(width: 8),
                  Expanded(
                    child: ContinueButton(
                      label: 'Tiếp tục',
                      target: '/introduction2',
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

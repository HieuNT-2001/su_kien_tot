import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/profile/post_section.dart';
import 'package:su_kien_tot/pages/profile/user_header.dart';
import 'package:su_kien_tot/pages/profile/user_stats.dart';
import 'package:su_kien_tot/pages/profile/verify_section.dart';
import 'package:su_kien_tot/providers/app_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String role = context.watch<AppState>().role;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hồ sơ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserHeader(isVerified: false),
          const SizedBox(height: 16),
          if (role == 'vendor') ...[
            const UserStats(),
            const SizedBox(height: 16),
            const PostSection(),
          ],
          const Spacer(),
          const VerifySection(isVerified: true),
        ],
      ),
    );
  }
}

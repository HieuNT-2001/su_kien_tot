import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/account/menu.dart';
import 'package:su_kien_tot/pages/account/menu_item.dart';
import 'package:su_kien_tot/pages/account/referral_banner.dart';
import 'package:su_kien_tot/pages/account/user_info.dart';
import 'package:su_kien_tot/widgets/role_switch.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  Future<void> _refreshData() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Tài khoản',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    RoleSwitch(),
                  ],
                ),
                const SizedBox(height: 16),
                const UserInfo(),
                const SizedBox(height: 16),
                const ReferralBanner(),
                const SizedBox(height: 16),
                Menu(
                  items: [
                    MenuItem(
                      title: 'Ví Vua Thợ',
                      icon: Icons.wallet,
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Nghiệp vụ của bạn',
                      icon: Icons.work_outline,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Menu(
                  items: [
                    MenuItem(
                      title: 'Cài đặt',
                      icon: Icons.settings_outlined,
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Ngôn ngữ',
                      icon: Icons.language,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Menu(
                  items: [
                    MenuItem(
                      title: 'Hỗ trợ',
                      icon: Icons.support_agent,
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Điều khoản & quyền riêng tư',
                      icon: Icons.article_outlined,
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Về chúng tôi',
                      icon: Icons.info_outline,
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Những câu hỏi thường gặp (FAQ)',
                      icon: Icons.live_help_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

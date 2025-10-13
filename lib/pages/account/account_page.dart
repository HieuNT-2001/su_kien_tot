import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/account/menu.dart';
import 'package:su_kien_tot/pages/account/menu_item.dart';
import 'package:su_kien_tot/pages/account/referral_banner.dart';
import 'package:su_kien_tot/pages/account/user_info.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/widgets/role_switch.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  Future<void> _refreshData() async {}

  Widget _buildMenuSection1(bool isCustomer) {
    return Menu(
      items: [
        MenuItem(
          title: isCustomer ? 'Thanh toán' : 'Ví Vua Thợ',
          icon: Icons.wallet,
          onTap: () {},
        ),
        MenuItem(
          title: isCustomer ? 'Ưu đãi của bạn' : 'Nghiệp vụ của bạn',
          icon: isCustomer ? Icons.discount_outlined : Icons.work_outline,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildMenuSection2() {
    return Menu(
      items: [
        MenuItem(title: 'Cài đặt', icon: Icons.settings_outlined, onTap: () {}),
        MenuItem(title: 'Ngôn ngữ', icon: Icons.language, onTap: () {}),
      ],
    );
  }

  Widget _buildMenuSection3(bool isCustomer) {
    return Menu(
      items: [
        if (isCustomer) ...[
          MenuItem(
            title: 'Yêu thích',
            icon: Icons.favorite_outline,
            onTap: () {},
          ),
        ],
        MenuItem(title: 'Hỗ trợ', icon: Icons.support_agent, onTap: () {}),
        MenuItem(
          title: 'Điều khoản & quyền riêng tư',
          icon: Icons.article_outlined,
          onTap: () {},
        ),
        MenuItem(title: 'Về chúng tôi', icon: Icons.info_outline, onTap: () {}),
        MenuItem(
          title: 'Những câu hỏi thường gặp (FAQ)',
          icon: Icons.live_help_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isCustomer = context.watch<AppState>().role == 'customer';

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
                _buildMenuSection1(isCustomer),
                const SizedBox(height: 16),
                _buildMenuSection2(),
                const SizedBox(height: 16),
                _buildMenuSection3(isCustomer),
                const SizedBox(height: 16),
                const Text(
                  'Phiên bản 0.1',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

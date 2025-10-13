import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/account/menu_section_1.dart';
import 'package:su_kien_tot/pages/account/menu_section_2.dart';
import 'package:su_kien_tot/pages/account/menu_section_3.dart';
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
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
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
                SizedBox(height: 16),
                UserInfo(),
                SizedBox(height: 16),
                ReferralBanner(),
                SizedBox(height: 16),
                MenuSection1(),
                SizedBox(height: 16),
                MenuSection2(),
                SizedBox(height: 16),
                MenuSection3(),
                SizedBox(height: 16),
                Text('Phiên bản 0.1', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/add_friend/invited_friends.dart';
import 'package:su_kien_tot/pages/add_friend/lucky_numbers.dart';
import 'package:su_kien_tot/pages/add_friend/referral_bonus_banner.dart';
import 'package:su_kien_tot/pages/add_friend/referral_bonus_wallet.dart';

class AddFriendPage extends StatelessWidget {
  final GlobalKey<InvitedFriendsState> _invitedFriendsKey = GlobalKey();

  AddFriendPage({super.key});

  Future<void> _refreshData() async {
    await _invitedFriendsKey.currentState?.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mời bạn bè', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ReferralBonusBanner(),
              const SizedBox(height: 16),
              const ReferralBonusWallet(),
              const SizedBox(height: 16),
              const LuckyNumbers(),
              const SizedBox(height: 16),
              InvitedFriends(key: _invitedFriendsKey),
            ],
          ),
        ),
      ),
    );
  }
}

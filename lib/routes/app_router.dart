import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/account/account_page.dart';
import 'package:su_kien_tot/pages/activity/activity_page.dart';
import 'package:su_kien_tot/pages/chat/chat_page.dart';
import 'package:su_kien_tot/pages/favorite/favorite_page.dart';
import 'package:su_kien_tot/pages/guide/guide_page.dart';
import 'package:su_kien_tot/pages/help/help_page.dart';
import 'package:su_kien_tot/pages/home/home_guest.dart';
import 'package:su_kien_tot/pages/home/home_user.dart';
import 'package:su_kien_tot/pages/introduction/introduction1.dart';
import 'package:su_kien_tot/pages/introduction/introduction2.dart';
import 'package:su_kien_tot/pages/introduction/introduction3.dart';
import 'package:su_kien_tot/pages/language/language_page.dart';
import 'package:su_kien_tot/pages/link_account/link_account_page.dart';
import 'package:su_kien_tot/pages/login_register/login_register.dart';
import 'package:su_kien_tot/pages/notification/notification_page.dart';
import 'package:su_kien_tot/pages/payment/payment_page.dart';
import 'package:su_kien_tot/pages/profile/profile_page.dart';
import 'package:su_kien_tot/pages/search/search_page.dart';
import 'package:su_kien_tot/pages/setting/setting_page.dart';
import 'package:su_kien_tot/pages/voucher/voucher_page.dart';
import 'package:su_kien_tot/pages/wallet/expense_wallet.dart';
import 'package:su_kien_tot/pages/wallet/revenue_wallet.dart';
import 'package:su_kien_tot/pages/wallet/wallet_page.dart';
import 'package:su_kien_tot/widgets/service_page.dart';
import 'package:su_kien_tot/pages/start/start.dart';
import 'package:su_kien_tot/pages/transaction_history/transaction_page.dart';
import 'package:su_kien_tot/widgets/floating_bar.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/start',
    routes: <RouteBase>[
      GoRoute(path: '/start', builder: (context, state) => const Start()),
      GoRoute(
        path: '/introduction1',
        builder: (context, state) => const Introduction1(),
      ),
      GoRoute(
        path: '/introduction2',
        builder: (context, state) => const Introduction2(),
      ),
      GoRoute(
        path: '/introduction3',
        builder: (context, state) => const Introduction3(),
      ),
      GoRoute(
        path: '/home-guest',
        builder: (context, state) => const HomeGuest(),
      ),
      GoRoute(
        path: '/login-register',
        builder: (context, state) => const LoginRegister(),
      ),
      GoRoute(
        path: '/search-page',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: '/service-page',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ServicePage(title: data['title'], image: data['image']);
        },
      ),
      GoRoute(
        path: '/transaction-page',
        builder: (context, state) => const TransactionPage(),
      ),
      GoRoute(
        path: '/payment-page',
        builder: (context, state) => const PaymentPage(),
      ),
      GoRoute(
        path: '/voucher-page',
        builder: (context, state) => const VoucherPage(),
      ),
      GoRoute(
        path: '/favorite-page',
        builder: (context, state) => const FavoritePage(),
      ),
      GoRoute(
        path: '/setting-page',
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: '/language-page',
        builder: (context, state) => const LanguagePage(),
      ),
      GoRoute(
        path: '/link-account-page',
        builder: (context, state) => const LinkAccountPage(),
      ),
      GoRoute(
        path: '/help-page',
        builder: (context, state) => const HelpPage(),
      ),
      GoRoute(
        path: '/profile-page',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/guide-page',
        builder: (context, state) => const GuidePage(),
      ),
      GoRoute(
        path: '/chat-page',
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        path: '/wallet-page',
        builder: (context, state) => const WalletPage(),
      ),
      GoRoute(
        path: '/revenue-wallet',
        builder: (context, state) => const RevenueWallet(),
      ),
      GoRoute(
        path: '/expense-wallet',
        builder: (context, state) => const ExpenseWallet(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            floatingActionButton: FloatingBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                if (index == 2) {
                  context.push('/chat-page');
                } else {
                  navigationShell.goBranch(index);
                }
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home-user',
                builder: (context, state) => const HomeUser(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/activity',
                builder: (context, state) => const ActivityPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chat-page',
                builder: (context, state) => const ChatPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/notification',
                builder: (context, state) => const NotificationPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/account',
                builder: (context, state) => const AccountPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

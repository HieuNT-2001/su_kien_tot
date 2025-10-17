import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/home/ad_banner.dart';
import 'package:su_kien_tot/pages/home/header.dart';
import 'package:su_kien_tot/pages/home/order_status.dart';
import 'package:su_kien_tot/pages/home/overview.dart';
import 'package:su_kien_tot/pages/home/register_banner.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/pages/home/benefit.dart';
import 'package:su_kien_tot/pages/home/news.dart';
import 'package:su_kien_tot/pages/home/quick_access.dart';
import 'package:su_kien_tot/widgets/custom_search_bar.dart';
import 'package:su_kien_tot/widgets/image_card.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  Future<void> _refreshData() async {
    // Giả lập tải dữ liệu mới trong 2 giây
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String role = context.watch<AppState>().role;

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (role == 'customer') ...[
                  CustomSearchBar(onTap: () => context.push('/search-page')),
                  const SizedBox(height: 16),
                  const QuickAccess(),
                  const SizedBox(height: 16),
                  ImageCard(
                    imageSrc: 'assets/images/banner.png',
                    onTap: () => context.push('/search-page'),
                  ),
                ],
                if (role == 'vendor') ...[
                  const Header(),
                  const SizedBox(height: 16),
                  const Overview(),
                  const SizedBox(height: 16),
                  const OrderStatus(),
                  const SizedBox(height: 16),
                  RegisterBanner(onTap: () {}),
                  const SizedBox(height: 16),
                  AdBanner(onTap: () {}),
                ],
                const SizedBox(height: 16),
                ImageCard(
                  title: 'Sự kiện đang diễn ra',
                  imageSrc: 'assets/images/banner.png',
                  onTap: () => context.push('/'),
                ),
                const SizedBox(height: 16),
                if (role == 'customer') ...[
                  const ImageCard(
                    title: 'Chiến dịch',
                    imageSrc: 'assets/images/banner.png',
                  ),
                ],
                const SizedBox(height: 16),
                const Benefit(),
                const News(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

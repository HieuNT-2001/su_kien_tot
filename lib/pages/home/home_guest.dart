import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/pages/home/benefit.dart';
import 'package:su_kien_tot/pages/home/home_app_bar.dart';
import 'package:su_kien_tot/pages/home/bottom_bar.dart';
import 'package:su_kien_tot/pages/home/bottom_model.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/widgets/custom_search_bar.dart';
import 'package:su_kien_tot/pages/home/list_service.dart';
import 'package:su_kien_tot/pages/home/news.dart';
import 'package:su_kien_tot/widgets/image_card.dart';

class HomeGuest extends StatefulWidget {
  const HomeGuest({super.key});

  @override
  State<HomeGuest> createState() => _HomeState();
}

class _HomeState extends State<HomeGuest> {
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF28F8F),
          foregroundColor: Colors.black,
          toolbarHeight: 140,
          title: const HomeAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (role == 'customer') ...[
                  const ImageCard(
                    title: 'Chiến dịch',
                    imageSrc: 'assets/images/banner.png',
                  ),
                  const SizedBox(height: 16),
                  CustomSearchBar(
                    onTap: () => showModalBottomSheet(
                      shape: const RoundedRectangleBorder(),
                      context: context,
                      builder: (context) {
                        return const PopupModel();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ListService(),
                ],
                ImageCard(
                  title: 'Sự kiện đang diễn ra',
                  imageSrc: 'assets/images/banner.png',
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const PopupModel(),
                  ),
                ),
                const SizedBox(height: 16),
                const Benefit(),
                const News(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const HomeBottomBar(),
      ),
    );
  }
}

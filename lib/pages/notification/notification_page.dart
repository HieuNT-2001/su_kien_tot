import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/models/tab_item.dart';
import 'package:su_kien_tot/widgets/custom_tab_bar.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isLoading = true;
  List<String> _notifications = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _notifications = ['thông báo 1'];
    // bạn có thể thử: ["Thông báo 1", "Thông báo 2"]
    setState(() => _isLoading = false);
  }

  Future<void> _emptyData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _notifications = [];
    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _notifications.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có thông báo');

    return Skeletonizer(
      enabled: _isLoading,
      child: Column(
        children: List.generate(length, (index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: Text(
                'Thông báo ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mô tả thông báo ${index + 1}'),
                  const SizedBox(height: 4),
                  const Text('10/10/2025'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Thông báo',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.checklist_rounded, size: 28),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTabBar(
                  tabs: [
                    TabItem(title: 'Tất cả', onTap: _refreshData),
                    TabItem(title: 'Dịch vụ', onTap: _emptyData),
                    TabItem(title: 'Giao dịch', onTap: _refreshData),
                    TabItem(title: 'Giới thiệu', onTap: _refreshData),
                    TabItem(title: 'Hệ thống', onTap: _refreshData),
                    TabItem(title: 'Tài khoản', onTap: _refreshData),
                    TabItem(title: 'Sự kiện', onTap: _refreshData),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDataSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
